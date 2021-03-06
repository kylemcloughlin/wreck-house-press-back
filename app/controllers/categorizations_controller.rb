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
    puts params
    articles = @categorization.articles.order(id: :desc)
    now = Time.zone.now.strftime("%Y-%m-%dT%H:%M:%S")
    art = articles.where("publish_time < ?", now).or(articles.where(publish_time: nil))
    render json: { header: @categorization[:name], articles: art, subcategorizations: @categorization.subcategorizations.order(id: :desc)}
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
      puts params
      @categorization = Categorization.find_by(name: params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def categorization_params
      params.require(:categorization).permit(:name)
    end
end
