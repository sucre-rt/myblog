class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    Articles.create(name: "", image: "", text: "")
  end

  def new
  end

  def destroy
  end
  
  def edit
  end

  def update
  end 
  
end
