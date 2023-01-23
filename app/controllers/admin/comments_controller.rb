class Admin::CommentsController < ApplicationController
  def create
  end

  def destroy
    comment = Comment.find(params[:id])
    user = comment.user
    comment.destroy
    redirect_to admin_user_path(user)
  end
end
