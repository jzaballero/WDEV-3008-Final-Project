# frozen_string_literal: true

# Application wide controller
class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  helper_method :link_pages
  helper_method :link_categories

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Product.find(session[:shopping_cart])
  end

  def link_pages
    Page.all
  end

  def link_categories
    Category.all
  end
end
