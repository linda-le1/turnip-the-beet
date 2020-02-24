class RecommendationsController < ApplicationController
  def new
  end

  def create
    redirect_to recommendations_path
  end
end
