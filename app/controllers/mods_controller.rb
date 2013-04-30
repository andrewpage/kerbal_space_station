class ModsController < ApplicationController
  def index
    @mods = Mod.order(:created_at)
  end

  def show
    @mod = Mod.find(params[:id])
  end

  def new
    @mod = Mod.new
  end

  def create
    @mod = Mod.new mod_params
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
    @mod.assign_attributes(mod_params)
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

  private

  def mod_params
    params.require(:mod).permit(:name, :description, :install, :version, :compatible, :changelog, :upload, :images)
  end
end
