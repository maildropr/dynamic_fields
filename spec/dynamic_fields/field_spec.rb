require 'spec_helper'

describe DynamicFields::Field do
  subject { DynamicFields::Field.new(:test_field) }

  describe ".new" do
    it "accepts a key and an optional options hash" do
      expect { DynamicFields::Field.new }.to raise_error
      expect { DynamicFields::Field.new(:field_key) }.to_not raise_error
      expect { DynamicFields::Field.new(:field_key, label: 'Bananas') }.to_not raise_error
    end
  end

  describe ".add_validator" do
    it "adds the given validator class" do
      subject.add_validator(TestValidator)
      subject.validators.should include TestValidator
    end
    
    it "adds default validator options"
  end
end
