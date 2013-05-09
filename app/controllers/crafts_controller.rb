class CraftsController < DownloadablesController
  def download
    @downloadable.increment!(:download_count)
    redirect_to @downloadable.upload
  end
end
