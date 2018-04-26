require "rails_helper"

RSpec.describe User, :type => :model do
  subject {
    described_class.new(
      first_name: "Nemanja",
      last_name: "Drakulovic",
      user_name: "Drakula",
      password: "password",
      password_confirmation: "password",
      email:"nemanja@drakulovic.com"
      )
    }
 describe "Validations" do
   it "is valid with valid attributes" do
     expect(subject).to be_valid
   end

   it "is invalid without a first name" do
     subject.first_name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a last name" do
     subject.last_name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a username" do
     subject.user_name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a password" do
     subject.password = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a password confirmation" do
     subject.password_confirmation = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without an email" do
     subject.email = nil
     expect(subject).to_not be_valid
   end
 end
end
