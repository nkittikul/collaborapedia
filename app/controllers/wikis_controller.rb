class WikisController < ApplicationController
  before_action :load_wiki, only: [:edit, :show, :update]

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit  
    authorize @wiki
  end

  def show   
    authorize @wiki
    @articles = @wiki.articles
    @collaborations = @wiki.collaborations
  end

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def create
    @wiki = Wiki.new(wiki_params)
    # @wiki.private = current_user.premium && params[:wiki][:private]
    @wiki.private = policy(@wiki).private? && params[:wiki][:private]
    authorize @wiki
    Collaboration.create(wiki: @wiki, user: current_user)
    if @wiki.save
      redirect_to @wiki, notice: "Wiki creation successful!"
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    authorize @wiki
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
    params.require(:wiki).permit(:name, :description)
  end

end
