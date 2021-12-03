class ApplicationController < ActionController::Base
  helper_method :link_pages
  helper_method :link_categories

  def link_pages
    Page.all
  end

  def link_categories
    Category.all
  end
end
