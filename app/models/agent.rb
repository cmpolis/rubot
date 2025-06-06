class Agent < ApplicationRecord
  has_many :runs, dependent: :destroy
  belongs_to :default_config, class_name: "LlmConfig", optional: true
end
