require 'active_support/hash_with_indifferent_access'
require 'active_support/inflector'

module DynamicFields
  class FieldCollection

    def add(field)
      fields[field.key] = field
    end

    def remove(field)
      field_name = if field.is_a? Field
        field.key
      else
        field
      end

      fields.delete field_name
    end

    def fields
      @fields ||= ActiveSupport::HashWithIndifferentAccess.new
    end

    def clear!
      @fields = nil
    end

    def include?(field_name)
      fields.include? field_name
    end

    class << self

      # Initialize a FieldCollection with Fields and Validators from an array
      #
      # @param [Array] definition an array of hashes specifying fields and their options
      #
      # Example definition:
      # [
      #   {
      #     key: "email", 
      #     label: "Email Address", 
      #     validators: [
      #       {
      #         class_name: "EmailValidator", 
      #         args: [ {strict: true} ]
      #       },
      #       {
      #         class_name: "PresenceValidator"
      #       }
      #     ]
      #   },
      #   {
      #     key: "salary",
      #     label: "Estimated monthly salary",
      #     validators: [
      #       {
      #         class_name: "PresenceValidator"
      #       },
      #       {
      #         class_name: "NumericalityValidator",
      #         args: [ {greater_than_or_equal_to: 0} ]
      #       }
      #     ]
      #   }
      # ]

      def from_array(definition)
        collection = new
        definition.each do |field_definition|
          
          field = construct_field_from_definition(field_definition)

          if field_definition[:validators]
            field_definition[:validators].each do |validator_definition|
              klass = ActiveSupport::Inflector.constantize validator_definition[:class_name]
              args = validator_definition[:args]

              field.add_validator(klass, *args)
            end
          end

          collection.add(field)
        end

        collection
      end

      private

      def construct_field_from_definition(field_definition)
        key = field_definition[:key]
        label = field_definition[:label]

        Field.new(key, label: label)
      end
    end

  end
end