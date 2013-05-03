class ModsController < ApplicationController
  VALID_MOD_KEYS = [:name, :upload, :images_attributes, :install, :description, :changelog, :version, :compatible]

  def index
    @mods = Mod.order(:created_at).decorate
  end

  def show
    @mod = Mod.find(params[:id]).decorate
  end

  def new
    @mod = Mod.new
    3.times { @mod.images.build }
  end

  def create
    @mod = Mod.new params[:mod].slice(*VALID_MOD_KEYS)
    if @mod.valid?
      @mod.save!
      redirect_to @mod
    else
      render :new
    end
  end

  def edit
    @mod = Mod.find(params[:id])
  end

  def update
    @mod = Mod.find(params[:id])
    @mod.assign_attributes(params[:mod].slice(*VALID_MOD_KEYS))
    if @mod.valid?
      @mod.save!
      redirect_to @mod
    else
      render :edit
    end
  end

  def destroy
    @mod = Mod.find(params[:id])
    @mod.destroy
    redirect :back
  end
end
