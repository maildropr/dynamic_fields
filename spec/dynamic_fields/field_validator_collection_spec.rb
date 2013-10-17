require 'spec_helper'

describe DynamicFields::FieldValidatorCollection do
  before { subject.add(TestValidator) }

  describe ".validators" do
    it "returns a hash" do
      subject.validators.should be_a Hash
    end
  end

  describe ".validator_classes" do
    it "returns an array of validator classes in the collection" do
      subject.validator_classes.should be_a Array
      subject.validator_classes.should include TestValidator
    end
  end

  describe ".remove" do
    it "removes the validator with the given class" do
      subject.validator_classes.should include TestValidator
      subject.remove(TestValidator)
      subject.validator_classes.should_not include TestValidator
    end
  end

  describe ".clear!" do
    it "removes all validators from the collection" do
      subject.validators.should_not be_empty

      subject.clear!

      subject.validators.should be_empty
    end
  end
end