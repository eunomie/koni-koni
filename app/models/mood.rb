# A mood is the expression of a feeling for a day
class Mood < ActiveRecord::Base
  validates :felt_on, presence: true
  validates :feeling, presence: true
  belongs_to :organization
  validates :organization, presence: true
  belongs_to :team

  enum feeling: {
    good: 'good',
    ordinary: 'ordinary',
    bad: 'bad'
  }

  def self.by_date(for_organization:, and_team: nil)
    params = { organization: for_organization }
    params = params.merge({ team_id: and_team.id }) unless and_team.nil?
    Mood.where(params).group_by(&:felt_on)
  end

  def self.dates_for(organization)
    [Mood.where({ organization: organization }).minimum(:felt_on),
     Mood.where({ organization: organization }).maximum(:felt_on)]
  end
end
