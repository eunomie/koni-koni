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

  def self.by_date(for_organization:)
    Mood.where(organization: for_organization).group_by(&:felt_on)
  end
end
