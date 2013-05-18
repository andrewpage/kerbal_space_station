class PagesController < ApplicationController
  def splash
    Account
    @view_full = true
    downloadables = if Downloadable.top(3).any? then Downloadable.top(3) else Downloadable.limit(3) end
    @top = downloadables.decorate
  end

  def search
    @downloadables = ModDecorator.decorate_collection(Mod.search(params[:q]).to_a)
  end
end
