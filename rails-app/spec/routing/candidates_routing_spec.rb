require "rails_helper"

RSpec.describe CandidatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/candidates").to route_to("candidates#index")
    end

    it "routes to #show" do
      expect(:get => "/candidates/1").to route_to("candidates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/candidates").to route_to("candidates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidates/1").to route_to("candidates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidates/1").to route_to("candidates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidates/1").to route_to("candidates#destroy", :id => "1")
    end
  end
end
