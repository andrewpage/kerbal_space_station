class DownloadablesController < ApplicationController
  before_filter :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :extract_tags, only: [:create, :update]


  private

  def vote(type, mod)
    unless current_account.send(:"#{type}s?", mod)
      current_account.send(type, mod)
    else
      current_account.send(:"un#{type}", mod)
    end
    flash[:notice] = "You've #{type}d #{mod.name}."
    redirect_to :back
  end

  def extract_tags
    tags = params.delete("hidden-mod")[:tags].split(",")
    params[:mod][:tags] = tags.map(&method(:name_to_tag))
  end

  def name_to_tag(name)
    Tag.where(name: name).first_or_initialize
  end

  def report_errors(resource)
    Rails.logger.warn("Something went wrong:")
    resource.errors.full_messages.each(&method(:error_line))
  end

  def error_line(error)
    Rails.logger.warn("\n  * #{error}")
  end
end
