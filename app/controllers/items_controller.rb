class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.includes(:user).order('created_at DESC')
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

  def show
  end

  private

  def create_params
    params.require(:product).permit(:image, :product_name, :product_explanation, :product_category_id, :product_status_id,
                                    :shipping_charges_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
