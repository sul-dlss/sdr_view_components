# frozen_string_literal: true

module ModelBuilder
  def build_model(test_string_field: nil, test_boolean_field: false)
    Class.new(ApplicationForm) do
      attribute :test_string_field, :string
      attribute :test_boolean_field, :boolean
    end.new(test_string_field:, test_boolean_field:)
  end
end
