# Authentified home page
class WelcomeAuthController < ApplicationController
  include MoodCreation

  def index
    @mood = Mood.new

    @moods = Mood.by_date for_organization: current_user.organization, and_team: current_user.team
    @presented_moods = @moods.update(@moods) { |_, mood| MoodsPresenter.new(mood, view_context).compute }
  end
end
