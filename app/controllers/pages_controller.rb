class PagesController < ApplicationController

  def index
    @date = Date.today
    @recipes = Recipe.where("DATE(created_at) = ?", @date).ordered
  end

  def paginate
    @date = Date.parse(params["date"])
    @recipes = Recipe.where("DATE(created_at) = ?", @date).ordered
    # binding.pry
    respond_to do |format|
      format.js { render :layout => false }
      format.html { render :action => "index" }
      format.json { render :action => "index" }
    end
  end
end
