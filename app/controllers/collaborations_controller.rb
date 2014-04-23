class CollaborationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find(params[:wiki_id])
    if @user
      Collaboration.create(user: @user, wiki: @wiki)
    else
      flash[:error] = "No user found for given email address."
      render :index
    end
  end


  def index
    @wiki = Wiki.find(params[:wiki_id])
  end


end