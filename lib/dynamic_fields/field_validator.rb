module DynamicFields
  class FieldValidator
    attr_reader :class_name, :options

    def initialize(class_name, options = {})
      @class_name = class_name
      @options = options
    end

    def validate(value)
    end
  end
end