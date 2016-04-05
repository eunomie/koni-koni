require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should validate_presence_of :occurred_on }
  it { should validate_presence_of :body }
  it { should have_one :team }
end
