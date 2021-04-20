class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :update, :destroy]

  # GET /advertisements
  def index
    @advertisements = Advertisement.all
    # byebug
    if @advertisement ===  nil
      render json: {visable: false}
    else
    now = Time.zone.now
    last = @advertisements.where("publish < ?", now.strftime("%Y-%m-%dT%H:%M:%S")).or(@advertisements.where(publish: nil))
    render json: last.last
    end
  end

  # GET /advertisements/1
  def show
    render json: @advertisement
  end

  # POST /advertisements
  def create
    @advertisement = Advertisement.new(advertisement_params)
    
    if @advertisement.save
      render json: @advertisement, status: :created, location: @advertisement
    else
      render json: @advertisement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advertisements/1
  def update
    @advertisement.visable = params[:advertisement][:visable]
    if @advertisement.save
      render json: @advertisement
    else
      render json: @advertisement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advertisements/1
  def destroy
    @advertisement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertisement_params
      params.require(:advertisement).permit(:link, :img, :publish, :visable)
    end
end
