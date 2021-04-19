class AdvertismentsController < ApplicationController
  before_action :set_advertisment, only: [:show, :update, :destroy]

  # GET /advertisments
  def index
    @advertisments = Advertisment.all

    render json: @advertisments
  end

  # GET /advertisments/1
  def show
    render json: @advertisment
  end

  # POST /advertisments
  def create
    @advertisment = Advertisment.new(advertisment_params)

    if @advertisment.save
      render json: @advertisment, status: :created, location: @advertisment
    else
      render json: @advertisment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advertisments/1
  def update
    if @advertisment.update(advertisment_params)
      render json: @advertisment
    else
      render json: @advertisment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advertisments/1
  def destroy
    @advertisment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisment
      @advertisment = Advertisment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertisment_params
      params.require(:advertisment).permit(:linkimg, :visible)
    end
end
