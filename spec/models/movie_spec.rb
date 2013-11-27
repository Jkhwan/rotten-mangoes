require 'spec_helper'

describe Movie do
  describe "Create Movie" do
    describe "Runtime in minutes" do
      it "should fail if runtime in minutes is not an integer" do
        m = Movie.new(runtime_in_minutes: "abc")
        expect(m.save).to eq(false)
        expect(m.errors[:runtime_in_minutes].first).to eq("is not a number")
      end
      it "should fail if runtime in minutes is less than zero" do
        m = Movie.new(runtime_in_minutes: 0)
        m.save
        expect(m.errors[:runtime_in_minutes].first).to eq("must be greater than 0")
      end
    end
  end
end
