# Handle mood creation
class MoodsController < ApplicationController
  include MoodCreation

  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # POST /moods
  # POST /moods.json
  # rubocop:disable Metrics/AbcSize
  def create
    create_mood success_to: :back, error_to: :new
  end
  # rubocop:enable Metrics/AbcSize
end
