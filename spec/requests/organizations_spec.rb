require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  describe "GET /organizations" do
    it "works!" do
      get organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
