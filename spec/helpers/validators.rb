class TestValidator; end
class EmailValidator; end

class PresenceValidator
  def self.validate(value)
    "must be present" unless value
  end
end

class NumericalityValidator; end