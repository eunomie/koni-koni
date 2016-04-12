# Organization is a set of teams of people
class Organization < ActiveRecord::Base
  validates :name, presence: true
  has_many :teams
  has_many :notes
  has_many :users
  has_many :moods

  def to_s
    name
  end
end
