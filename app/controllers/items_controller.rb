class ItemsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(create_params)
    if @product.save
      redirect_to root_path
    else
      render new_item_path
    end

  end

private
def create_params
 params.require(:prodct).permit(:image,:product_name,:product_explanation,:product_category_id,:product_status_id,:shipping_charges_id,:delivery_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)

end
