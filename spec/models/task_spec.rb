require "rails_helper"

RSpec.describe Task, :type => :model do
  subject {
    described_class.new(
      name: "Task One",
      points: 5,
      due_date: Time.now.strftime("%D"),
      priority: 2,
      project_id: 1
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

   it "is invalid without a priority" do
     subject.priority = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a due date" do
     subject.due_date = nil
     expect(subject).to_not be_valid
   end
  end
end
