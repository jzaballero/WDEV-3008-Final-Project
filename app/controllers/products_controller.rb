require 'date'

class ProductsController < ApplicationController
  def index
    @products = Product.includes(:categories).all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.joins(:products)
                          .where(products: { id: params[:id] })
  end

  def search
    keyword = "%#{params[:keywords]}%"
    @products = Product.where('name LIKE ?', keyword)
                       .or(Product.where('description LIKE ?', keyword))
                       .paginate(page: params[:page], per_page: 10)
  end

  def filter
    @today = Date.today
    @three_days = Date.today - 3
    @recently_posted = Product.where('created_at between ? and ?', @today, @three_days)
                              .paginate(page: params[:page], per_page: 10)
  end
end
