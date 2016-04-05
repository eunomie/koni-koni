require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :users }
  it { should have_many :teams }
  it { should have_many :moods }
  it { should have_many :notes }
end
