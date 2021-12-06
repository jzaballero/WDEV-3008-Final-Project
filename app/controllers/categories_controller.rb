class CategoriesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.joins(:categories).where(categories: { id: params[:id] }).paginate(page: params[:page],
                                                                                           per_page: 18)

    add_breadcrumb @category.name, category_path(id: @category.id)
  end
end
