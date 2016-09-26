class ApplicationController < ActionController::API
  before_action :set_pagination, only: [:index]

  private
  def set_pagination
    # TODO: read from environment variables
    params[:page] = 0 if params[:page].blank?
    params[:per_page] = Kaminari.config.default_per_page if params[:per_page].blank?
  end
end
