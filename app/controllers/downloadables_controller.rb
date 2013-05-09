class DownloadablesController < ApplicationController
  before_filter :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_downloadable, only: [:show, :edit, :update, :ignore, :bookmark, :report, :like, :dislike, :download]

  def index
    @downloadables = Downloadable.type(type).order(:created_at).decorate
  end

  def show
  end

  def new
    @downloadable = current_account.send(contexts).build.decorate
    3.times { @downloadable.images.build }
  end

  def create
    @downloadable = current_account.send(contexts).build(valid_parameters)
    form = DownloadableTagForm.new(@downloadable, params[context][:tags])
    if form.valid?
      form.save!
      flash[:notice] = "Your #{context} has been saved!"
      redirect_to(@downloadable)
    else
      report_errors(@downloadable)
      (3 - @downloadable.images.size).times { @downloadable.images.build }
      render(:new)
    end
  end

  def edit
    (3 - @downloadable.images.size).times { @downloadable.images.build }
  end

  def update
    @downloadable.assign_attributes(valid_paramters)
    form = DownloadableTagForm.new(@downloadable, params[context][:tags])
    if form.valid?
      form.save!
      flash[:notice] = "Your #{context} has been saved!"
      redirect_to(@downloadable)
    else
      report_errors(@downloadable)
      (3 - @downloadable.images.size).times { @downloadable.images.build }
      render(:edit)
    end
  end

  def destroy
    @downloadable.destroy
    flash[:notice] = "You've deleted #{@downloadable.name}."
    redirect_to url_for(controller: contexts, action: :index)
  end

  def like
    vote(:like, @downloadable)
  end

  def dislike
    vote(:dislike, @downloadable)
  end

  # def report
  #   @downloadable.reported_by(current_account)
  #   flash.now[:notice] = "Thanks for reporting this upload! We'll check it out."
  #   redirect_to :back
  # end

  # Use for update emails
  def bookmark
    unless current_account.bookmarks?(@downloadable)
      current_account.bookmark(@downloadable)
      current_account.increment!(:bookmark_count)
    else
      current_account.unbookmark(@downloadable)
      current_account.decrement!(:bookmark_count)
    end
    flash[:notice] = "You've bookmarked #{@downloadable.name}."
    redirect_to :back
  end

  private

  def vote(choice, downloadable)
    unless current_account.send(:"#{choice}s?", downloadable)
      current_account.send(choice, downloadable)
    else
      current_account.send(:"un#{choice}", downloadable)
    end
    flash[:notice] = "You've #{choice}d #{downloadable.name}."
    redirect_to :back
  end

  def report_errors(resource)
    Rails.logger.warn("Something went wrong:")
    resource.errors.full_messages.each(&method(:error_line))
  end

  def error_line(error)
    Rails.logger.warn("\n  * #{error}")
  end

  def find_downloadable
    @_downloadable = Downloadable.type(type).where(id: params[:id]).first
    unless @_downloadable.present?
      flash[:alert] = "That #{@_downloadable} either no longer exists or never existed."
      redirect_to url_for(controller: contexts, action: :index)
    end
    @downloadable = @_downloadable.decorate if @_downloadable
  end

  def contexts
    params[:controller]
  end

  def context
    contexts.singularize
  end

  def type
    context.capitalize
  end

  def valid_paramters
    params[context].slice(*type.constantize::VALID_PARAMS)
  end
end
