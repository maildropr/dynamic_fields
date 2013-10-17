module DynamicFields
  class FieldValidatorCollection

    def validators
      @validators ||= Hash.new
    end

    def validator_classes
      validators.keys
    end

    def [](class_name)
      validators[class_name]
    end

    def add(class_name, default_options = {})
      validators[class_name] = FieldValidator.new(class_name, default_options)
    end

    def include?(klass)
      validators.include? klass
    end

    def remove(class_name)
      validators.delete class_name
    end

    def clear!
      @validators = nil
    end

  end
end