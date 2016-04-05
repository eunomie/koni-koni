class Team < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :organization
  has_many :users
end
