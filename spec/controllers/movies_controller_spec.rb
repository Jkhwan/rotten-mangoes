require 'spec_helper'

describe MoviesController do
  describe "GET index" do
    it "returns 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "" do
      
    end
  end
end
