# User of all the application
class User < ActiveRecord::Base
  include Clearance::User
end
