# A note describe a event occurred a defined day
class Note < ActiveRecord::Base
  validates :occurred_on, presence: true
  validates :body, presence: true
  belongs_to :organization
  has_one :team
end
