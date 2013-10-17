require 'dynamic_fields/field_validator_collection'

module DynamicFields
  class Field

    attr_reader :key, :label, :validators

    def initialize(key, options = {})
      @key = key
      @label = options[:label]
    end

    def add_validator(validator_class, default_options = {})
      validators.add(validator_class, default_options)
    end

    def validators
      @validators ||= FieldValidatorCollection.new
    end

    def validate(value)
      validation_errors = Array.new

      validators.each do |validator|
        result = validator.validate(value)
        validation_errors << result if result
      end

      validation_errors.flatten
    end

  end
end