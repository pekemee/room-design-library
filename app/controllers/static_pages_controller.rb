class StaticPagesController < ApplicationController
  def home
    if params[:sort]=="like"
      @sort="いいね順"
      @microposts = Micropost.find(Like.group(:micropost_id).order('count(micropost_id) desc').pluck(:micropost_id))
      @microposts=Kaminari.paginate_array(@microposts).page(params[:page]).per(12)
    elsif params[:sort]=="new"
      @sort="新着順"
      @microposts = Micropost.recent
      @microposts=Kaminari.paginate_array(@microposts).page(params[:page]).per(12)
    else
      @sort="新着順"
      @microposts = Micropost.recent
      @microposts=Kaminari.paginate_array(@microposts).page(params[:page]).per(12)
    end
  end

  def concept
  end

  def about
  end

  def contact
  end
end
