class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:item_id])
    @user_buy = UserBuy.new
  end

  def create
    @product = Product.find(params[:item_id])
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      Payjp.api_key = "sk_test_81e1c227014f57dc5d846694"
      Payjp::Charge.create(
        amount: buy_params[:price], 
        card: buy_params[:token], 
        currency: 'jpy'     
      )
      @user_buy.save
      redirect_to root_path
    else
      @product = Product.find(params[:item_id])
      render action: :index
    end
  end


    private
   def buy_params
    params.require(:user_buy).permit(:shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name, :phone_number).merge(user_id:current_user.id, item_id: params[:item_id],token: params[:token],price:@product.price)
   end

end
