module Concerns
  module IndexWithDefaultPaging
    extend ActiveSupport::Concern

    included do
      before_action :set_pagination, only: [:index]
    end

    def set_pagination
      params[:page] = 0 if params[:page].blank?
      params[:per_page] = Kaminari.config.default_per_page if params[:per_page].blank?
    end
  end

end
