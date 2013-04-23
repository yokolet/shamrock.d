class SlideshowController < ApplicationController
  def index
    @pages = Page.all.sort {|x, y| x.no <=> y.no}
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @pages = Page.all
    @no = params[:id].to_i
    respond_to do |format|
      format.html
      format.js
    end
  end
end
