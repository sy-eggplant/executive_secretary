require 'rails_helper'

RSpec.describe "EventPeople", type: :request do
  describe "GET /event_people" do
    it "works! (now write some real specs)" do
      get event_people_path
      expect(response).to have_http_status(200)
    end
  end
end
