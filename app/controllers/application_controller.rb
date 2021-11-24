class ApplicationController < ActionController::Base
  helper_method :link_pages

  def link_pages
    Page.all
  end
end
