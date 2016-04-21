# User of all the application
class User < ActiveRecord::Base
  include Clearance::User
  include Gravtastic
  gravtastic

  validates :name, presence: true
  belongs_to :organization
  belongs_to :team
end
