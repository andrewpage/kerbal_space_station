class ModsController < ApplicationController
  before_filter :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_mod, only: [:show, :ignore, :bookmark, :report, :like, :dislike, :download]

  VALID_MOD_KEYS = [:name, :upload, :images_attributes, :install, :description, :changelog, :version, :compatible]

  def index
    @mods = Mod.order(:created_at).decorate
  end

  def show
    @mod = @mod.decorate
  end

  def new
    @mod = current_account.mods.build
    3.times { @mod.images.build }
  end

  def create
    @mod = current_account.mods.build(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      redirect_to(@mod)
    else
      Rails.logger.warn("Something went wrong:")
      @mod.errors.full_messages.each do |error|
        Rails.logger.warn("\n  * #{error}")
      end
      @mod.images = (1..3).map { @mod.images.build }
      render(:new)
    end
  end

  def edit
    @mod = current_account.mods.find(params[:id]).decorate
  end

  def update
    @mod = current_account.mods.find(params[:id])
    @mod.assign_attributes(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      flash[:notice] = "Your mod has been saved!"
      redirect_to(@mod)
    else
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
    unless current_account.likes?(@mod)
      current_account.like(@mod)
    else
      current_account.unlike(@mod)
    end
    flash[:notice] = "You've liked #{@mod.name}."
    redirect_to :back
  end

  def dislike
    unless current_account.dislikes?(@mod)
      current_account.dislike(@mod)
    else
      current_account.undislike(@mod)
    end
    flash[:notice] = "You've disliked #{@mod.name}."
    redirect_to :back
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
    @mod = Mod.find(params[:id])
  end
end
