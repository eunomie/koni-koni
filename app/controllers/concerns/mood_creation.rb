# Concern to DRY mood's creation
module MoodCreation
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def create_mood(success_to:, error_to:)
    if current_user.last_felt_on.try(:today?)
      respond_to do |format|
        format.html { render error_to }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end

    @mood = Mood.new(
      mood_params.merge(
        felt_on: Time.zone.today,
        organization: current_user.organization
      )
    )

    user_params = { last_felt_on: Time.zone.today }
    team_id = params[:team]
    unless team_id.blank?
      user_params = user_params.merge({ team: Team.find(team_id) })
    end
    current_user.update user_params

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
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def mood_params
    params.require(:mood).permit(:feeling)
  end
end
