class RecommendationsController < ApplicationController

  def new
  end

  def index
    render locals: {
      recommendations: RecommendationFacade.new(params, current_user.token)
    }
  end
end
