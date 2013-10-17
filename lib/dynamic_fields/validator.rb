module DynamicFields
  class Validator

    def initialize(field_definitions = [], fields = {})
      @field_definitions = field_definitions
      @fields = fields
    end

    def valid?
      true
    end

  end
end