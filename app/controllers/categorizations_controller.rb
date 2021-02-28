class CategorizationsController < ApplicationController
  before_action :set_categorization, only: [:show, :update, :destroy]

  # GET /categorizations
  def index
    @categorizations = Categorization.all
puts params[:name]
puts'index'
    render json: @categorizations
  end

  # GET /categorizations/1
  def show
    puts params[:name]
    render json: @categorization.articles
  end

  # POST /categorizations
  def create
    @categorization = Categorization.new(categorization_params)

    if @categorization.save
      render json: @categorization, status: :created, location: @categorization
    else
      render json: @categorization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categorizations/1
  def update
    if @categorization.update(categorization_params)
      render json: @categorization
    else
      render json: @categorization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categorizations/1
  def destroy
    @categorization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorization
      @categorization = Categorization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categorization_params
      params.require(:categorization).permit(:name)
    end
end
