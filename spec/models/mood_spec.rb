require 'rails_helper'

RSpec.describe Mood, type: :model do
  it { should validate_presence_of :felt_on }
  it { should validate_presence_of :feeling }
  it { should belong_to :team }
  it { should validate_presence_of :organization }
end
