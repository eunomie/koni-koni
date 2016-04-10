# A mood is the expression of a feeling for a day
class Mood < ActiveRecord::Base
  validates :felt_on, presence: true
  validates :feeling, presence: true
  belongs_to :organization
  validates :organization, presence: true
  has_one :team

  enum feeling: {
    good: 'good',
    ordinary: 'ordinary',
    bad: 'bad'
  }
end
