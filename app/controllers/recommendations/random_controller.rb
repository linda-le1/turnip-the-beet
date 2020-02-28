class Recommendations::RandomController < ApplicationController
  def index
    params[:mood] = random_mood[0]
    params[:cuisine] = random_cuisine[0]
    render locals: {
      recommendations: RecommendationFacade.new(params, current_user.token)
    }
  end

  private

  def random_cuisine
    ['italian', 'mexican', 'indian', 'american',
     'thai', 'greek', 'chinese', 'japanese', 'latin',
     'bbq', 'vietnamese', 'korean', 'french'].sample(1)
  end

  def random_mood
    ['frisky', 'party', 'chill', 'happy', 'jazzy',
     'glum', 'classy', 'romantic',
     'folksy', 'sunny'].sample(1)
  end
end
