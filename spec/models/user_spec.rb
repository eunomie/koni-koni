require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should belong_to :organization }
  it { should belong_to :team }
end
