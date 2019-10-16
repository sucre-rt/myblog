class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    Article.create(article_params)
  end

  def new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user.id == current_user.id
  end
  
  def edit
  end

  def update
  end 

  private
  def article_params
    params.permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
