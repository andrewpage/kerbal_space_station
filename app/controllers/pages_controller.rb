class PagesController < ApplicationController
  def splash
    Account
    @view_full = true
    mods = if Mod.top(3).any? then Mod.top(3) else Mod.limit(3) end
    @top_mods = ModDecorator.decorate_collection(mods)
  end
end
