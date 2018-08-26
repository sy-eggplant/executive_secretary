require 'rails_helper'

RSpec.describe "PeopleDates", type: :request do
  describe "GET /people_dates" do
    it "works! (now write some real specs)" do
      get people_dates_path
      expect(response).to have_http_status(200)
    end
  end
end
