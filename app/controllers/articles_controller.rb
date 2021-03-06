class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    @article = Article.create(create_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def new
    @article = Article.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user.id == current_user.id
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(update_params) if article.user.id == current_user.id
  end 

  private
  def create_params
    params.require(:article).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def update_params
    params.permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
