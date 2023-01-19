class Public::ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
    @tag = Tag.new
  end

  def index
    #params[:search]が来たらtrueでモデルのsearchメソッドを呼ぶ
    if params[:search]
      @contribution = Contribution.search_by_word(params[:search])
    else
      #タグの検索
      if !params[:tag_name] || params[:tag_name].empty?
        @contribution = Contribution.all
      else
        #タグテーブルの全情報
        tags = Tag.where(name: params[:tag_name])
        #タグidの全情報
        contribution_tag_relations = ContributionTagRelation.where(tag_id: tags.pluck(:id))
        #必要なタグidの全情報
        @contribution = Contribution.find(contribution_tag_relations.pluck(:contribution_id))
      end
    end
  end

  def show
    @contribution = Contribution.find(params[:id])

    @comments = @contribution.comments
    @comment = Comment.new
  end

  def edit
    @contribution = Contribution.find(params[:id])

    unless @contribution.user == current_user
      redirect_to edit_contribution_path
    end
  end

  def update
    @contribution = Contribution.find(params[:id])

    if @contribution.user != current_user
      redirect_to  edit_contribution_path
    else
      if @contribution.update(contribution_params)
        redirect_to contribution_path
      else
        render :edit
      end
    end
  end

  def create
    #タイトル、本文、動画の記述
    @contribution = Contribution.new(contribution_params)
    @contribution.user_id = current_user.id

    if @contribution.save
      #タグの記述
      tag = Tag.new
      tag.name = params[:tag]

      if tag.save
        contribution_copy = Contribution.find_by(user_id: current_user.id, title: contribution_params[:title], text: contribution_params[:text] )
        contribution_id = contribution_copy.id

        tag_copy = Tag.find_by(name: params[:tag])
        tag_id = tag_copy.id

        contribution_tag_relation = ContributionTagRelation.new
        contribution_tag_relation[:contribution_id] = contribution_id
        contribution_tag_relation[:tag_id] = tag_id
        contribution_tag_relation.save!

        redirect_to contributions_path
      else
        render :new
      end
    else
      @error_contribution = @contribution
      @tag = Tag.new
      render :new
    end
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to contributions_path
  end

  private

  def contribution_params
    params.require(:contribution).permit(:title, :text, :video)
  end
end
