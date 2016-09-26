class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :update, :destroy]

  # GET /developers
  def index
    @developers = Developer.where search_params

    paginate json: @developers
  end

  # GET /developers/1
  def show
    render json: @developer
  end

  # POST /developers
  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      render json: @developer, status: :created, location: @developer
    else
      render json: @developer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /developers/1
  def update
    if @developer.update(developer_params)
      render json: @developer
    else
      render json: @developer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /developers/1
  def destroy
    @developer.destroy
  end

  private
    # Loads the developer by its id and assigns it to @developer.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Allowed parameters for PUT, PATCH and POST requests.
    def developer_params
      params.require(:developer).permit(:name, :age)
    end

    # Allowed parameters for GET requests on root URL.
    def search_params
      params.permit(:name, :age)
    end
end
