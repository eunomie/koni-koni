# Authentified home page
class WelcomeAuthController < ApplicationController
  include MoodCreation

  def index
    @mood = Mood.new

    @moods = Mood.by_date for_organization: current_user.organization
    @moods.update(@moods) { |_, mood| MoodsPresenter.new(mood, view_context).compute }

    unless current_user.team.nil?
      @moods_for_team = Mood.by_date for_organization: current_user.organization, and_team: current_user.team
      @moods_for_team.update(@moods_for_team) { |_, mood| MoodsPresenter.new(mood, view_context).compute }
    end
  end
end
