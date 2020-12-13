require "rails_helper"

RSpec.describe AppointmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/shareds").to route_to("shareds#index")
    end

    it "routes to #create" do
      expect(:post => "/shareds").to route_to("shareds#create")
    end
  end
end
