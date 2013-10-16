require 'dynamic_fields/validator_collection'

module DynamicFields
  class Field

    attr_reader :key, :label, :validators

    def initialize(key, options = {})
      @key = key
      @validators = build_validator_collection(options[:validators])
      @label = options[:label]
    end

    def build_validator_collection(definition)
      []
    end
  end
end