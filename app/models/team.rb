# A logical set of people in an organization
class Team < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :organization
  has_many :users

  def to_s
    name
  end
end
