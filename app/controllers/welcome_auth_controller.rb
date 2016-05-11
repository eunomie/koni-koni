# Authentified home page
class WelcomeAuthController < ApplicationController
  include MoodCreation

  def index
    @mood = Mood.new

    dates = Mood.dates_for current_user.organization
    @moods = ({
      dates[0] => [],
      dates[1] => []
    }).merge(Mood.by_date for_organization: current_user.organization, and_team: current_user.team)
    @presented_moods = MoodsPresenter.from @moods, view_context
  end
end
