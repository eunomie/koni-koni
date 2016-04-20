# Authentified home page
class WelcomeAuthController < ApplicationController
  include MoodCreation

  def index
    @mood = Mood.new
  end

  def create
    create_mood success_to: :back, error_to: :index
  end
end
