class ModsController < ApplicationController
  VALID_MOD_KEYS = [:name, :upload, :images_attributes, :install, :description, :changelog, :version, :compatible]

  def index
    @mods = Mod.order(:created_at).decorate
  end

  def show
    @mod = Mod.find(params[:id]).decorate
  end

  def new
    @mod = current_account.mods.build
    3.times { @mod.images.build }
  end

  def create
    @mod = current_user.mods.build(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      redirect_to(@mod)
    else
      Rails.logger.warn("Something went wrong:")
      @mod.errors.full_messages.each do |error|
        Rails.logger.warn("\n  * #{error}")
      end
      render(:new)
    end
  end

  def edit
    @mod = current_user.mods.find(params[:id]).decorate
  end

  def update
    @mod = current_user.mods.find(params[:id])
    @mod.assign_attributes(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      redirect_to(@mod)
    else
      render(:edit)
    end
  end

  def destroy
    @mod = current_user.mods.find(params[:id])
    @mod.destroy
    redirect :back
  end
end
