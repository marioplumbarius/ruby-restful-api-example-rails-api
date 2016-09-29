class DevelopersController < ApplicationController
  include Concerns::IndexWithDefaultPaging

  before_action :set_developer, only: [:show, :update, :destroy]

  # :nocov:
  swagger_controller :developers, 'Developers'

  swagger_api :index do
    summary 'Fetches all developers'
    notes 'This list all developers from database'
    param :query, :page, :integer, :optional, 'page to fetch results from'
    param :query, :per_page, :integer, :optional, 'number of developers per page'
    param :query, :name, :string, :optional, 'the name of the developer'
    param :query, :name, :integer, :optional, 'the age of the developer'
  end
  # :nocov:

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
