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

  def self.by_date(for_organization: nil, and_team: nil)
    if for_organization.nil?
      moods = Mood.all
    else
      params = { organization: for_organization }
      params = params.merge({ team_id: and_team.id }) unless and_team.nil?
      moods = Mood.where(params)
    end
    moods.group_by(&:felt_on)
  end

  def self.dates_for(organization)
    [Mood.where({ organization: organization }).minimum(:felt_on),
     Mood.where({ organization: organization }).maximum(:felt_on)]
  end

  def self.dates
    [Mood.minimum(:felt_on),
     Mood.maximum(:felt_on)]
  end
end
