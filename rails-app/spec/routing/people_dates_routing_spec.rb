require "rails_helper"

RSpec.describe PeopleDatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/people_dates").to route_to("people_dates#index")
    end

    it "routes to #show" do
      expect(:get => "/people_dates/1").to route_to("people_dates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/people_dates").to route_to("people_dates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/people_dates/1").to route_to("people_dates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/people_dates/1").to route_to("people_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/people_dates/1").to route_to("people_dates#destroy", :id => "1")
    end
  end
end
