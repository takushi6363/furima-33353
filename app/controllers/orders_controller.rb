class OrdersController < ApplicationController

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      @user_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end


    private
   def buy_params
    params.require(:user_buy).permit(:shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name, :phone_number)
   end

end
