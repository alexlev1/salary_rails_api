class Employe < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :salary, presence: true

  belongs_to :user
end
