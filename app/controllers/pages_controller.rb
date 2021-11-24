class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])
  end
end
