class ArticlesController < ApplicationController
  before_action :load_article, only: [:edit, :show, :update]
  before_action :load_wiki

  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.wiki = @wiki
    if @article.save
      redirect_to [@wiki, @article], notice: "Article creation successful!"
    else
      flash[:error] = "There was an error creating the article. Please try again."
      render :new
    end
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to [@wiki, @article], notice: "Article update successful!"
    else
      flash[:error] = "Error updating article. Please try again"
      render :edit
    end
  end

  def destroy
  end

  private

  def load_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

  def load_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :wiki_id)
  end
end
