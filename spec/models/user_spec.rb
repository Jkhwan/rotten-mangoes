require 'spec_helper'

describe User do
  describe "fullname" do
    it "should return the user's fullname" do
      u = User.new(firstname: "K", lastname: "V")
      expect(u.full_name).to eq("K V")
    end
  end
end
