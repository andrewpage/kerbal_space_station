class ModsController < ApplicationController
  before_filter :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_mod, only: [:show, :ignore, :bookmark, :report, :like, :dislike, :download]
  before_filter :extract_tags, only: [:create, :update]
  VALID_MOD_KEYS = [:name, :upload, :images_attributes, :install, :description, :changelog, :version, :compatible, :license, :source, :tags]

  def index
    @mods = Mod.order(:created_at).decorate
  end

  def show
    @mod = @mod.decorate
  end

  def new
    @mod = current_account.mods.build(images: empty_images()).decorate
  end

  def create
    @mod = current_account.mods.build(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      redirect_to(@mod)
    else
      report_errors(@mod)
      @mod.images << empty_images
      render(:new)
    end
  end

  def edit
    @mod = current_account.mods.find(params[:id]).decorate
    @mod.images << empty_images
  end

  def update
    @mod = current_account.mods.find(params[:id])
    @mod.assign_attributes(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      flash[:notice] = "Your mod has been saved!"
      redirect_to(@mod)
    else
      report_errors(@mod)
      @mod.images << empty_images
      render(:edit)
    end
  end

  def destroy
    @mod = current_account.mods.find(params[:id])
    @mod.destroy
    flash[:notice] = "You've deleted #{@mod.name}."
    redirect_to mods_path
  end

  def like
    vote(:like, @mod)
  end

  def dislike
    vote(:dislike, @mod)
  end

  # def report
  #   @mod.reported_by(current_account)
  #   flash.now[:notice] = "Thanks for reporting this upload! We'll check it out."
  #   redirect_to :back
  # end

  # Use for update emails
  def bookmark
    unless current_account.bookmarks?(@mod)
      current_account.bookmark(@mod)
      current_account.increment!(:bookmark_count)
    else
      current_account.unbookmark(@mod)
      current_account.decrement!(:bookmark_count)
    end
    flash[:notice] = "You've bookmarked #{@mod.name}."
    redirect_to :back
  end

  def download
    @mod.increment!(:download_count)
    redirect_to @mod.upload
  end

  private

  def find_mod
    @mod = Mod.where(id: params[:id]).first
    unless @mod.present?
      flash[:alert] = "That mod either no longer exists or never existed."
      redirect_to mods_path
    end
  end

  def vote(type, mod)
    unless current_account.send(:"#{type}s?", mod)
      current_account.send(type, mod)
    else
      current_account.send(:"un#{type}", mod)
    end
    flash[:notice] = "You've #{type}d #{@mod.name}."
    redirect_to :back
  end

  def extract_tags
    tags = params.delete("hidden-mod")[:tags].split(",")
    params[:mod][:tags] = tags.map(&method(:name_to_tag))
  end

  def name_to_tag(name)
    Tag.where(name: name).first_or_initialize
  end

  def report_errors(resource)
    Rails.logger.warn("Something went wrong:")
    resource.errors.full_messages.each(&method(:error_line))
  end

  def error_line(error)
    Rails.logger.warn("\n  * #{error}")
  end

  def maximum_images(resource)
    1..(Mod::MAXIMUM_IMAGES - resource.images.size)
  end

  def empty_images(resource = Mod.new)
    maximum_images(resource).map { Image.new }
  end
end
