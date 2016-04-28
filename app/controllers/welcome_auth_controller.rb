# Authentified home page
class WelcomeAuthController < ApplicationController
  include MoodCreation

  def index
    @mood = Mood.new

    @moods = Mood.by_date for_organization: current_user.organization
  end

  def create
    create_mood success_to: :back, error_to: :index
  end
end
