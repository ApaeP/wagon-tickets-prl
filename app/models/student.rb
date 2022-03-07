class Student < ApplicationRecord
  belongs_to :batch
  has_many :tickets, dependent: :destroy
end
