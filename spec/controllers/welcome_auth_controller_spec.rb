require 'rails_helper'

RSpec.describe WelcomeAuthController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  describe 'GET #index' do
    it 'returns http success' do
      sign_in_as user
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
