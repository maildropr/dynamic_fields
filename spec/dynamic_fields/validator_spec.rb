require 'spec_helper'

describe DynamicFields::Validator do
  include SampleDataHelper

  describe ".new" do
    it "accepts field definitions and field values" do
      expect do
        DynamicFields::Validator.new(sample_field_definition, sample_valid_fields)
      end.to_not raise_error
    end
  end

  describe ".valid?" do
    context "with valid values" do
      subject { DynamicFields::Validator.new(sample_field_definition, sample_valid_fields) }

      it "returns true" do
        subject.valid?
        puts subject.errors
        subject.should be_valid
      end
    end

    context "with invalid values" do
      subject { DynamicFields::Validator.new(sample_field_definition, sample_invalid_fields) }

      it "returns false" do
        subject.should_not be_valid
      end
    end
  end

  describe ".errors" do
    before { subject.valid? }

    context "with validation errors" do
      subject { DynamicFields::Validator.new(sample_field_definition, sample_invalid_fields) }
      it "returns a hash of errors" do
        subject.errors.should_not be_empty
        subject.errors.should be_a Hash
      end
    end

    context "without validation errors" do
      subject { DynamicFields::Validator.new(sample_field_definition, sample_valid_fields) }

      it "returns nil" do
        subject.errors.should be_nil
      end
    end
  end

end