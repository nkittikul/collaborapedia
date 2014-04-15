class WikisController < ApplicationController
  before_action :load_wiki, only: [:edit, :show]

  def new
    @wiki = Wiki.new
  end

  def edit  
    @wiki = Wiki.find(params[:id]) 
  end

  def show   
    @wiki = Wiki.find(params[:id]) 
  end

  def index
    @wikis = Wiki.all
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      redirect_to @wiki, notice: "Wiki was created successfully."
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
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
    params.require(:wiki).permit(:name, :description)
  end

end
