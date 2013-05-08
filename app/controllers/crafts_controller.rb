class CraftsController < DownloadablesController
  before_filter :find_craft, only: [:show, :ignore, :bookmark, :report, :like, :dislike, :download]

  VALID_CRAFT_KEYS = [:name, :file, :images_attributes, :description, :compatible, :tags]

  def index
    @crafts = Craft.order(:created_at).decorate
  end

  def show
    @craft = @craft.decorate
  end

  def new
    @craft = current_account.crafts.build.decorate
    3.times { @craft.images.build }
  end

  def create
    @craft = current_account.crafts.build(params[:craft].slice(*VALID_CRAFT_KEYS))
    if @craft.valid?
      @craft.save!
      redirect_to(@craft)
    else
      report_errors(@craft)
      (3 - @craft.images.size).times { @craft.images.build }
      render(:new)
    end
  end

  def edit
    @craft = current_account.crafts.find(params[:id]).decorate
    (3 - @craft.images.size).times { @craft.images.build }
  end

  def update
    @craft = current_account.crafts.find(params[:id])
    @craft.assign_attributes(params[:craft].slice(*VALID_MOD_KEYS))
    if @craft.valid?
      @craft.save!
      flash[:notice] = "Your craft has been saved!"
      redirect_to(@craft)
    else
      report_errors(@craft)
      (3 - @craft.images.size).times { @craft.images.build }
      render(:edit)
    end
  end

  def destroy
    @craft = current_account.crafts.find(params[:id])
    @craft.destroy
    flash[:notice] = "You've deleted #{@craft.name}."
    redirect_to crafts_path
  end

  def like
    vote(:like, @craft)
  end

  def dislike
    vote(:dislike, @craft)
  end

  # def report
  #   @craft.reported_by(current_account)
  #   flash.now[:notice] = "Thanks for reporting this upload! We'll check it out."
  #   redirect_to :back
  # end

  # Use for update emails
  def bookmark
    unless current_account.bookmarks?(@craft)
      current_account.bookmark(@craft)
      current_account.increment!(:bookmark_count)
    else
      current_account.unbookmark(@craft)
      current_account.decrement!(:bookmark_count)
    end
    flash[:notice] = "You've bookmarked #{@craft.name}."
    redirect_to :back
  end

  def download
    @craft.increment!(:download_count)
    redirect_to @craft.upload
  end

  private

  def find_craft
    @craft = Craft.where(id: params[:id]).first
    unless @craft.present?
      flash[:alert] = "That craft either no longer exists or never existed."
      redirect_to crafts_path
    end
  end
end
