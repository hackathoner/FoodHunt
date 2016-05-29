class PagesController < ApplicationController

  def index
    @recipes = Recipe.ordered
  end
end
