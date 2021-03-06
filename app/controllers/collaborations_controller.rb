class CollaborationsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator_user = User.find_by_email(params[:email])
    @wiki = Wiki.find(params[:wiki_id])

    if @wiki.collaborations.exists?(user_id: @collaborator_user)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
    elsif @collaborator_user.nil?
      flash[:alert] = "The email address #{@collaborator_user} was not found."
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = Collaboration.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
      if @collaborator.save
        flash[:notice] = "#{@collaborator_user.email} was added as a collaborator."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:notice] = "There was an error adding this collaborator. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaboration.find(params[:id])
    @collaborator_user = User.find(@collaborator.user_id)

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error removing this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
