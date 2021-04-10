class SubcategorizationsController < ApplicationController
  before_action :set_subcategorization, only: [:show, :update, :destroy]

  # GET /subcategorizations
  def index
    puts 'hit index'
    if params[:nav]
    puts "hit if"
    puts params[:categorization_id]
    cat_id = params[:categorization_id]
    @categorization = Categorization.find_by(id:  cat_id)
    @subcategorizations =  @categorization.subcategorizations
    render json: @subcategorizations
    else
    puts "hiing else"
    @subcategorization = Subcategorization.all
    render json: @subcategorization
    end
  end

  # GET /subcategorizations/1
  def show

 categorization = Categorization.find(@subcategorization.categorization_id)
    render json: { header: @subcategorization[:name], articles: @subcategorization.articles.order(id: :desc), subcategorizations: categorization.subcategorizations.order(id: :desc)  }
  end

  # POST /subcategorizations
  def create
    @subcategorization = Subcategorization.new(subcategorization_params)

    if @subcategorization.save
      render json: @subcategorization, status: :created, location: @subcategorization
    else
      render json: @subcategorization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subcategorizations/1
  def update
    if @subcategorization.update(subcategorization_params)
      render json: @subcategorization
    else
      render json: @subcategorization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subcategorizations/1
  def destroy
    @subcategorization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategorization
      
        
      @subcategorization = Subcategorization.find_by(name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subcategorization_params
      params.require(:subcategorization).permit(:name, :categorization_id, :nav)
    end
end
