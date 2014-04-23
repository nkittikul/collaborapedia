class WikisController < ApplicationController
  before_action :load_wiki, only: [:edit, :show, :update]

  def new
    @wiki = Wiki.new
  end

  def edit  
  end

  def show   
    @articles = @wiki.articles
    @collaborations = @wiki.collaborations
  end

  def index
    @wikis = Wiki.all
  end

  def create
    @wiki = Wiki.new(wiki_params)
    Collaboration.create(wiki: @wiki, user: current_user)
    if @wiki.save
      redirect_to @wiki, notice: "Wiki creation successful!"
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki, notice: "Wiki update successful!"
    else
      flash[:error] = "Error updating wiki. Please try again"
      render :edit
    end
  end

  def destroy
  end

private

  def load_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:name, :description, :article_id)
  end

end
