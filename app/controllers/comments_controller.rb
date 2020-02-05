class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @micropost=Micropost.find_by(id: params[:micropost_id])
    @comments = @micropost.comments
  end

  def create
    @micropost=Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id=current_user.id
    if @comment.save
      @comments=@micropost.comments
      @micropost.user.send_comment_notice(@comment)
      flash[:success]="Posted your comment"
      redirect_back(fallback_location: root_path)
    else
      @comments=@micropost.comments
      flash[:danger]="Failed to post"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment=Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
