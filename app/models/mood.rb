class Mood < ActiveRecord::Base
  validates :felt_on, presence: true
  validates :feeling, presence: true
  belongs_to :organization
  has_one :team

  enum feeling: {
                 good: 'good',
                 ordinary: 'ordinary',
                 bad: 'bad'
                }
end
