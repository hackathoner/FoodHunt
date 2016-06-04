class PagesController < ApplicationController

  def index
    @date = Time.now.to_date
    @recipes = Recipe.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def paginate
    @date = Date.parse(params["date"])

    if @date == Date.today
      @recipes = Recipe.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    else
      @recipes = Recipe.where(created_at: @date.beginning_of_day..@date.end_of_day)
    end
    
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
