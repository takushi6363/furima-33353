class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @product = Product.all.order("created_at DESC")
    @shipping_charges = ["着払い(購入者負担)","送料込み(出品者負担)"]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def create_params
    params.require(:product).permit(:image, :product_name, :product_explanation, :product_category_id, :product_status_id,
                                    :shipping_charges_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
