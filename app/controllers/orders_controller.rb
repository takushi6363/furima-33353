class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :already_sold
  before_action :seller

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      set_product
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:user_buy).permit(:shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @product.price
    )
  end

  def set_product
    @product = Product.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def already_sold
    redirect_to root_path unless @product.buy.nil?
  end
  
  def seller
    redirect_to root_path if current_user.id == @product.user.id
  end

end
