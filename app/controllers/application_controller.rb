class ApplicationController < ActionController::Base
  before_filter :favorited_mods
  before_filter :updated_mods
  before_filter :newest_mods


  private

  def favorited_mods
    Account
    @favorited_mods = Mod.top(10).decorate
  end

  def updated_mods
    @updated_mods = Mod.order(:updated_at).limit(10).decorate
  end

  def newest_mods
    @newest_mods = Mod.order(:created_at).limit(10).decorate
  end
end
