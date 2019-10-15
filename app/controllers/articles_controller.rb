class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    Article.create(title: article_params[:title], image: article_params[:image], text: article_params[:text], user_id: current_user.id)
  end

  def new
  end

  def destroy
  end
  
  def edit
  end

  def update
  end 

  private
  def article_params
    params.permit(:title, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
