class Public::FavoritesController < ApplicationController
  def create
    @contribution = Contribution.find(params[:contribution_id])
    favorite = current_user.favorites.new(contribution_id: @contribution.id)
    favorite.save
    redirect_to contribution_path(@contribution)
  end

  def destroy
    @contribution = Contribution.find(params[:contribution_id])
    favorite = current_user.favorites.find_by(contribution_id: @contribution.id)
    favorite.destroy
    redirect_to contribution_path(@contribution)
  end
end
