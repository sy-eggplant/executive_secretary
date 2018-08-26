require "rails_helper"

RSpec.describe EventPeopleController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/event_people").to route_to("event_people#index")
    end

    it "routes to #show" do
      expect(:get => "/event_people/1").to route_to("event_people#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/event_people").to route_to("event_people#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_people/1").to route_to("event_people#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_people/1").to route_to("event_people#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_people/1").to route_to("event_people#destroy", :id => "1")
    end
  end
end
