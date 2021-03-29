class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :not_a_loggedin_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @product.update(create_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    set_product
    @product.destroy
    redirect_to root_path
  end


  private

  def create_params
    params.require(:product).permit(:image, :product_name, :product_explanation, :product_category_id, :product_status_id,
                                    :shipping_charges_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def not_a_loggedin_user
    redirect_to root_path if current_user.id != @product.user.id
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
