class RecommendationsController < ApplicationController
  before_action :check_token, only: [:index]

  def new
  end

  def index
    render locals: {
      recommendations: RecommendationFacade.new(params, current_user.token)
    }
  end

  private

  def check_token
    redirect_to "/recommendations/new" if !current_user || current_user.expired_token?
  end
end
