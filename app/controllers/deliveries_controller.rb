class DeliveriesController < ApplicationController
  before_action :set_delivery,            only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user,          only: [:index, :create, :edit, :update, :destroy]
  before_action :admin_user,              only: [:destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all.paginate(page: params[:page])
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      flash[:success] = "Delivery was successfully created."
      redirect_to @delivery
    else
      render 'new'
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    if @delivery.update(delivery_params)
      flash[:success] = "Delivery was successfully updated."
      redirect_to @delivery
    else
      render 'edit'
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    flash[:success] = "Delivery was successfully destroyed."
    redirect_to deliveries_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:address1, :address2, :city, :state, :zip_code, :notes)
    end
end
