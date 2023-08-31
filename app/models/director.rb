class Director < ApplicationRecord
  has_many :movies, dependent: :destroy

  multisearchable against: [:first_name, :last_name]
end
