class ApplicationController < ActionController::Base
  before_filter :load_account
  before_filter :favorited_mods
  before_filter :updated_mods
  before_filter :newest_mods


  private

  def load_account
    Account
  end

  def favorited_mods
    @favorited_mods = ModDecorator.decorate(Mod.top(10))
  end

  def updated_mods
    @updated_mods = Mod.order(:updated_at).limit(10).decorate
  end

  def newest_mods
    @newest_mods = Mod.order(:created_at).limit(10).decorate
  end

  def updated_crafts
    @updated_crafts = Craft.order(:updated_at).limit(10).decorate
  end

  def newest_crafts
    @newest_crafts = Craft.order(:created_at).limit(10).decorate
  end
end
