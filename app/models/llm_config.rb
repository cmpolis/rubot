class LlmConfig < ApplicationRecord
  validates :provider, presence: true, inclusion: { in: %w[openai] }
  validates :version, presence: true
  validates :name, presence: true, uniqueness: true

  has_many :agents, foreign_key: 'default_config_id'
  # validates :default_parameters, presence: true
  
  # validate :validate_default_parameters_format

  private

  def validate_default_parameters_format
    return if default_parameters.nil?
    
    unless default_parameters.is_a?(Hash)
      errors.add(:default_parameters, "must be a valid JSON object")
    end
  rescue JSON::ParserError
    errors.add(:default_parameters, "must be valid JSON")
  end
end