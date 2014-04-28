class CollaborationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new(user: @user, wiki: @wiki)
    authorize @collaboration
    if @collaboration.save
      redirect_to :index
    else
      flash[:error] = "No user found for given email address."
      render :index
    end
  end


  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new(user: current_user, wiki: @wiki)
    # raise Pundit::NotAuthorizedError, "not authorized fuck" unless CollaborationPolicy.new(current_user, @wiki).index?
    authorize Collaboration
  end


end