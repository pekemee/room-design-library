class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
  end
  def create
    @micropost = current_user.microposts.build(micropost_params)
    get_photo_types
    if @micropost.save
      @microposts = current_user.microposts.paginate(page: params[:page])
      flash[:success] = "Micropost created!"
      redirect_back(fallback_location: root_path)
    else
      @microposts = current_user.microposts.paginate(page: params[:page])
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @micropost=Micropost.find_by(id: params[:id])
    @comments = @micropost.comments
  end

  def show_by_type
    if params[:sort]=="like"
      get_posts_type_and_likes(params[:type])
      @microposts=Kaminari.paginate_array(@microposts).page(params[:page]).per(12)
      @sort="likes"
    else
      get_posts_by_type(params[:type])
      @microposts=Kaminari.paginate_array(@microposts).page(params[:page]).per(12)
      @sort="newer"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :private, :living,
                                        :bed, :kitchen, :bath, :entrance, :balcony,
                                        :sea, :antique, :modern, :simple, :north,
                                        :japan, :girly)
    end

    def correct_user
      @micropost=Micropost.find_by(id: params[:id])
      if current_user.microposts.find_by(id:params[:id]).nil? &&
        !current_user.admin?
        redirect_to root_url
      end
    end

    def get_posts_by_type(type)
      @type=type.to_str
      @microposts=Micropost.recent.where("#{type}=true")
    end

    def get_posts_type_and_likes(type)
      @type=type.to_str
      @microposts=[]
      microposts = Micropost.find(Like.group(:micropost_id).order('count(micropost_id) desc').pluck(:micropost_id))
      microposts.each do |post|
        if post.send(@type)==true
          @microposts << post
        end
      end
    end

    def get_photo_types
      params[:micropost][:private] == '1' ? @micropost.private=true : @micropost.private=false
      params[:micropost][:living] == '1' ? @micropost.living=true : @micropost.living=false
      params[:micropost][:bed] == '1' ? @micropost.bed=true : @micropost.bed=false
      params[:micropost][:kitchen] == '1' ? @micropost.kitchen=true : @micropost.kitchen=false
      params[:micropost][:bath] == '1' ? @micropost.bath=true : @micropost.bath=false
      params[:micropost][:entrance] == '1' ? @micropost.entrance=true : @micropost.entrance=false
      params[:micropost][:balcony] == '1' ? @micropost.balcony=true : @micropost.balcony=false
      params[:micropost][:sea] == '1' ? @micropost.sea=true : @micropost.sea=false
      params[:micropost][:antique] == '1' ? @micropost.antique=true : @micropost.antique=false
      params[:micropost][:modern] == '1' ? @micropost.modern=true : @micropost.modern=false
      params[:micropost][:simple] == '1' ? @micropost.simple=true : @micropost.simple=false
      params[:micropost][:north] == '1' ? @micropost.north=true : @micropost.north=false
      params[:micropost][:japan] == '1' ? @micropost.japan=true : @micropost.japan=false
      params[:micropost][:girly] == '1' ? @micropost.girly=true : @micropost.girly=false
    end
end
