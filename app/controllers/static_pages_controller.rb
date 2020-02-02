class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.paginate(page: params[:page])
    @page=params[:page]
  end

  def concept
  end

  def about
  end

  def contact
  end
end
