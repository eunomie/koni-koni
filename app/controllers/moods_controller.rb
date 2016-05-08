# Handle mood creation
class MoodsController < ApplicationController
  include MoodCreation

  # GET /moods
  def index
    all_moods = Mood.by_date for_organization: current_user.organization
    @no_team_moods = {}
    @no_team_moods[:moods] = all_moods
    @no_team_moods[:presented] = MoodsPresenter.from all_moods, view_context

    @team_moods = current_user.organization.teams.map do |team|
      moods = ({
                all_moods.keys.min => [],
                all_moods.keys.max => []
              }).merge(Mood.by_date(for_organization: current_user.organization, and_team: team))
      {
        team.name => {
          moods:     moods,
          presented: MoodsPresenter.from(moods, view_context)
        }
      }
    end.reduce({}, :merge)
  end

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
