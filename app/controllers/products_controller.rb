require 'date'

class ProductsController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @products = Product.includes(:categories).paginate(page: params[:page], per_page: 10)
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.joins(:products)
                          .where(products: { id: params[:id] })

    add_breadcrumb @categories.first.name, category_path(id: @categories.first.id)
    add_breadcrumb 'Product', product_path(id: params[:id])
  end

  def search
    keyword = "%#{params[:keywords]}%"
    search_category = params[:search_category].to_s

    @products = if search_category == ''
                  Product.joins(:categories)
                         .where('products.name LIKE ?', keyword)
                         .or(Product.where('products.description LIKE ?', keyword))
                         .paginate(page: params[:page], per_page: 10)
                else
                  Product.joins(:categories)
                         .where('categories.id = ? and
                                 (products.name LIKE ? or
                                 products.description LIKE ?)', search_category, keyword, keyword)
                         .paginate(page: params[:page], per_page: 10)
                end
  end

  def filter
    today = Date.today + 1
    three_days = today - 3

    @recently_posted = Product.joins(:categories)
                              .where('products.created_at between ? and ?', three_days, today)
                              .paginate(page: params[:page], per_page: 10)

    @recently_updated = Product.joins(:categories)
                               .where('products.updated_at between ? and ?', three_days, today)
                               .paginate(page: params[:page], per_page: 10)
  end
end
