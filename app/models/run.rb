class Run < ApplicationRecord
  belongs_to :agent
  has_many :steps, dependent: :destroy
end
