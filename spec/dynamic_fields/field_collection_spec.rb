require 'spec_helper'

describe DynamicFields::FieldCollection do
  include SampleDataHelper

  describe '.from_array' do
    subject { DynamicFields::FieldCollection.from_array(sample_field_definition) }

    it "returns a FieldCollection" do
      subject.should be_a DynamicFields::FieldCollection
    end
    it "adds fields to the field collection with appropriate options" do
      subject.should include "email"
      subject.fields[:email].label.should == "Email Address"
    end
  end
end