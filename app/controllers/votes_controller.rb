class VotesController < ApplicationController

  before_action :authenticate_user!

  def toggle
    @recipe = Recipe.find(params[:id])

    if params[:voted] == "true"
      @vote = @recipe.votes.find_by(:user => current_user)
      @vote.destroy

      render :json => { :recipe => @recipe.id, :type => "destroy" }
    else
      create(@recipe.id)
    end
  end

  private

  def create(recipe_id)
    @recipe = Recipe.find(recipe_id)
    @vote = @recipe.votes.new(:user => current_user)

    if @vote.save
      render :json => { :recipe => @recipe.id, :type => "create" }
    else
      render :json => { :success => false }
    end
  end
  
end
