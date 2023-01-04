class Public::ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def index
    @contribution = Contribution.all
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
    contribution = Contribution.new(contribution_params)
    contribution.user_id = current_user.id
    contribution.save
    redirect_to contributions_path
  end

  private
  def contribution_params
    params.require(:contribution).permit(:title, :text, :video)
  end
end
