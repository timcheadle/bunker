require 'rails_helper'

RSpec.describe "Bottles", :type => :request do
  describe "GET /bottles" do
    it "works! (now write some real specs)" do
      get bottles_path
      expect(response).to have_http_status(200)
    end
  end
end
