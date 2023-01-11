class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @contribution = Contribution.find(params[:contribution_id])
    @comment.contribution_id = params[:contribution_id]
    if @comment.save!
      redirect_to contribution_path(@contribution.id)
    else
      redirect_to contribution_path(@contribution.id)
    end
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :contribution_id)
  end


end
