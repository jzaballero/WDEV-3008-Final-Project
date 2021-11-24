class ProductsController < ApplicationController
  def index
    @products = Product.includes(:categories).paginate(page: params[:page], per_page: 18)
  end

  def show
    @product = Product.where(params[:id])
  end
end
