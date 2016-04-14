# Handle mood creation
class MoodsController < ApplicationController
  include MoodCreation

  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # POST /moods
  # POST /moods.json
  def create
    create_mood success_to: :back, error_to: :new
  end
end
