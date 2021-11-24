class ProductsController < ApplicationController
  def index
    @products = Product.includes(:categories).paginate(page: params[:page], per_page: 18)
  end

  def show
    @product = Product.find(params[:id])
  end

  # TODO: search
end
