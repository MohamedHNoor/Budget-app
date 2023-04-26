class Group < ApplicationRecord
  has_and_belongs_to_many :entities, dependent: :destroy
  belongs_to :user
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
