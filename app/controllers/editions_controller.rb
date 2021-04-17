class EditionsController < ApplicationController
  before_action :set_edition, only: [:show, :update, :destroy]

  # GET /editions
  def index
    @editions = Edition.all

    render json: @editions
  end

  # GET /editions/1
  def show
    render json: @edition
  end

  # POST /editions
  def create
    @edition = Edition.new(edition_params)

    if @edition.save
      render json: @edition, status: :created, location: @edition
    else
      render json: @edition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /editions/1
  def update
    if @edition.update(edition_params)
      render json: @edition
    else
      render json: @edition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /editions/1
  def destroy
    @edition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edition
      @edition = Edition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edition_params
      params.require(:edition).permit(:pdf)
    end
end
