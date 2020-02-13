class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.page(params[:page]).per(12)
  end

  def concept
  end

  def about
  end

  def contact
  end
end
