require 'rails_helper'

RSpec.describe "Kanjis", type: :request do
  describe "GET /kanjis" do
    it "works! (now write some real specs)" do
      get kanjis_path
      expect(response).to have_http_status(200)
    end
  end
end
