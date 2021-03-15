class SuSbsriptionsController < ApplicationController
  before_action :set_su_sbsription, only: [:show, :update, :destroy]

  # GET /su_sbsriptions
  def index
    @su_sbsriptions = SuSbsription.all

    render json: @su_sbsriptions
  end

  # GET /su_sbsriptions/1
  def show
    render json: @su_sbsription
  end

  # POST /su_sbsriptions
  def create
    @su_sbsription = SuSbsription.new(su_sbsription_params)

    if @su_sbsription.save
      render json: @su_sbsription, status: :created, location: @su_sbsription
    else
      render json: @su_sbsription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /su_sbsriptions/1
  def update
    if @su_sbsription.update(su_sbsription_params)
      render json: @su_sbsription
    else
      render json: @su_sbsription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /su_sbsriptions/1
  def destroy
    @su_sbsription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_su_sbsription
      @su_sbsription = SuSbsription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def su_sbsription_params
      params.require(:su_sbsription).permit(:name, :cost)
    end
end
