class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.joins(:categories).where(categories: { id: params[:id]}).paginate(page: params[:page], per_page: 18)
  end
end
