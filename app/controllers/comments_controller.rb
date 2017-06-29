class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:post_id].blank?
      @parent = Video.find(params[:video_id])
    else
      @parent = Post.find(params[:post_id])
    end
    @comment = @parent.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if params[:post_id].blank?
      redirect_to video_path(@parent)
    else
      redirect_to post_path(@parent)
    end

  end

  def destroy
    if params[:post_id].blank?
      @parent = Video.find(params[:video_id])
    else
      @parent = Post.find(params[:post_id])
    end
    @comment = @parent.comments.find(params[:id])
    @comment.destroy

    if params[:post_id].blank?
      redirect_to video_path(@parent)
    else
      redirect_to post_path(@parent)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
