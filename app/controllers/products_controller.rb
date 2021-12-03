class ProductsController < ApplicationController
  def index
    @products = Product.includes(:categories).paginate(page: params[:page], per_page: 10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    keyword = "%#{params[:keywords]}%"
    @products = Product.where('name LIKE ?', keyword)
                       .or(Product.where('description LIKE ?', keyword))
                       .paginate(page: params[:page], per_page: 10)
  end
end
