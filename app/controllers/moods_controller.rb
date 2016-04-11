# Handle mood creation
class MoodsController < ApplicationController
  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # POST /moods
  # POST /moods.json
  # rubocop:disable Metrics/AbcSize
  def create
    @mood = Mood.new(mood_params.merge(felt_on: Time.zone.today))

    respond_to do |format|
      if @mood.save
        format.html { redirect_to :back, notice: 'Mood was successfully created.' }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render :new }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def mood_params
    params.require(:mood).permit(:feeling)
  end
end
