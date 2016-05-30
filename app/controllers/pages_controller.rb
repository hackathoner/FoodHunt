class PagesController < ApplicationController

  def index
    @date = Date.today
    @recipes = Recipe.where("DATE(created_at) = ?", @date).ordered
  end

  def paginate
    @date = Date.parse(params["date"])
    @recipes = Recipe.where("DATE(created_at) = ?", @date).ordered

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
    end
  end

  def search
    @query = params[:q]

    if @query.empty?
      @recipes = Recipe.ordered
    else
      @recipes = Recipe.fuzzy_search(@query)
    end

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json {}
    end
  end
end
