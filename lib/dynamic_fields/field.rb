require 'dynamic_fields/field_validator_collection'

module DynamicFields
  class Field

    attr_reader :key, :label, :validators

    def initialize(key, options = {})
      @key = key
      # @validators = build_validator_collection(options[:validators])
      @label = options[:label]
    end

    def add_validator(validator_class, default_options = {})
      validators.add(validator_class, default_options)
    end

    def validators
      @validators ||= FieldValidatorCollection.new
    end

    # def build_validator_collection(definition)
    #   ValidatorCollection.new
    # end
  end
end