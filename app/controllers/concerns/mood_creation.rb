# Concern to DRY mood's creation
module MoodCreation
  extend ActiveSupport::Concern

  def create_mood(success_to:, error_to:)
    @mood = Mood.new(mood_params.merge(
                                       felt_on: Time.zone.today,
                                       organization: current_user.organization
                                      ))

    respond_to do |format|
      if @mood.save
        format.html { redirect_to success_to, notice: 'Mood was successfully created.' }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render error_to }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:feeling)
  end
end
