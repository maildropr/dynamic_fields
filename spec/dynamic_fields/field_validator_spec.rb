require 'spec_helper'

describe DynamicFields::FieldValidator do
  include SampleDataHelper

  describe ".new" do
    it "accepts field definitions and field values" do
      expect do
        DynamicFields::FieldValidator.new(sample_field_definition, sample_valid_fields)
      end.to_not raise_error
    end
  end

  describe ".valid?" do
    context "with valid values" do
      subject { DynamicFields::FieldValidator.new(sample_field_definition, sample_valid_fields) }

      it "returns true" do
        subject.should be_valid
      end
    end

    context "with invalid values" do
      subject { DynamicFields::FieldValidator.new(sample_field_definition, sample_invalid_fields) }

      it "returns false" do
        subject.should_not be_valid
      end
    end
  end

  describe ".errors" do
    context "with validation errors" do
      it "returns a hash of errors"
    end

    context "without validation errors" do
      it "returns nil"
    end
  end

end