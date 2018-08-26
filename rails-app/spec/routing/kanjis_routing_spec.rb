require "rails_helper"

RSpec.describe KanjisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/kanjis").to route_to("kanjis#index")
    end

    it "routes to #show" do
      expect(:get => "/kanjis/1").to route_to("kanjis#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/kanjis").to route_to("kanjis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/kanjis/1").to route_to("kanjis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/kanjis/1").to route_to("kanjis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kanjis/1").to route_to("kanjis#destroy", :id => "1")
    end
  end
end
