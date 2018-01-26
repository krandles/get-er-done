require "rails_helper"

RSpec.describe Project, :type => :model do
  subject {
    described_class.new(
      name: "Project One",
      points: 15
    )
  }

  describe "Validations" do

   it "is invalid without a name" do
     subject.name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without points" do
     subject.points = nil
     expect(subject).to_not be_valid
   end

   it "is invalid if points are a string" do
     subject.points = "543"
     expect(subject).to_not be_valid
   end

   it "is invalid if the points exceed the limit" do
     subject.points = 21
     expect(subject).to_not be_valid
   end
  end
end
