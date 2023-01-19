class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.text = params.require(:comment)[:text]
    @comment.user_id = current_user.id
    @contribution = Contribution.find(params[:contribution_id])
    @comment.contribution_id = params[:contribution_id]

    if @comment.save
      redirect_to contribution_path(@contribution.id)
    else
      @error_comment = @comment
      @contribution = Contribution.find(params[:contribution_id])
      @comments = @contribution.comments
      @comment = Comment.new

      render 'public/contributions/show'
    end
  end

  def edit
    @comments = Comment.find(params[:id])

    unless @comments.user == current_user
      redirect_to contribution_path(@comments.contribution)
    end
  end

  def update
    @comments = Comment.find(params[:id])

    if @comments.user != current_user
      redirect_to  edit_contribution_path
    else
      if @comments.update(comment_params)
        redirect_to contribution_path(@comments.contribution)
      else
        render :edit
      end
    end
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy

    redirect_to contribution_path(@comments.contribution)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :contribution_id)
  end
end
