require 'spec_helper'

module GtfsEngine
  describe StopController do

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        expect(response).to be_success
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        get 'show'
        expect(response).to be_success
      end
    end

  end
end