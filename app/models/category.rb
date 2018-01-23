class Category < ApplicationRecord
  has_many :tasks

  validates :name, presence:true
  validates :name, uniqueness:true
end
