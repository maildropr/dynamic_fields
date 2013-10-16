module SampleDataHelper
  def sample_field_definition
    [
      {
        key: "email", 
        label: "Email Address", 
        validators: [
          {
            class_name: "EmailValidator", 
            args: [ {strict: true} ]
          },
          {
            class_name: "PresenceValidator"
          }
        ]
      },
      {
        key: "salary",
        label: "Estimated monthly salary",
        validators: [
          {
            class_name: "PresenceValidator"
          },
          {
            class_name: "NumericalityValidator",
            args: [ {greater_than_or_equal_to: 0} ]
          }
        ]
      }
    ]
  end

  def sample_valid_fields
    {
      email: "john_smith@example.com",
      "salary" => 500_000
    }
  end

  def sample_invalid_fields
    {
      email: "notanemail"
    }
  end
end