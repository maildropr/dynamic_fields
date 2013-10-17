require 'active_support/hash_with_indifferent_access'

module DynamicFields
  class Validator

    attr_reader :fields

    def initialize(field_definitions = [], fields = {})
      @field_collection = FieldCollection.from_array(field_definitions)
      @fields = ActiveSupport::HashWithIndifferentAccess.new(fields)
      @errors = ActiveSupport::HashWithIndifferentAccess.new
    end

    def valid?
      @errors.clear

      @field_collection.each do |field|
        value = @fields[field.key]
        result = field.validate(value)

        @errors[field.key] = result unless result.empty?
      end

      @errors.empty?
    end

    def errors
      @errors.empty? ? nil : @errors
    end

  end
end