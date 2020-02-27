class Category < ApplicationRecord
  has_many :groupcategories, dependent: :destroy
  has_many :groups, through: :groupcategories
  has_many :options, dependent: :destroy
  has_many :tasks
  validates :title, presence: true, uniqueness: true
  validates :kind, inclusion: { in: ["Task", "Event"] }
end
