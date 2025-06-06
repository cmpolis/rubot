class Agent < ApplicationRecord
  has_many :runs, dependent: :destroy
end
