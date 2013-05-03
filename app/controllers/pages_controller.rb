class PagesController < ApplicationController
  def splash
    Account
    @view_full = true
    @top_mods = if Mod.top(3).any? then Mod.top(3) else Mod.limit(3) end.decorate
  end
end
