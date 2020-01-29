class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      @microposts = current_user.microposts.paginate(page: params[:page])
      flash[:success] = "Micropost created!"
      redirect_back(fallback_location: root_path)
    else
      @microposts = current_user.microposts.paginate(page: params[:page])
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost=Micropost.find_by(id: params[:id])
      if current_user.microposts.find_by(id:params[:id]).nil? &&
        !current_user.admin?
        redirect_to root_url
      end
    end
end
