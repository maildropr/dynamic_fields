require 'spec_helper'

def add_sample_field(field_collection, field_name)
  field = DynamicFields::Field.new(field_name)
  field_collection.add(field)
end

describe DynamicFields::FieldCollection do
  include SampleDataHelper

  subject { DynamicFields::FieldCollection.new }

  describe '.from_array' do
    subject { DynamicFields::FieldCollection.from_array(sample_field_definition) }

    it "returns a FieldCollection" do
      subject.should be_a DynamicFields::FieldCollection
    end

    it "adds fields to the field collection with appropriate options" do
      subject.should include "email"
      subject.fields[:email].label.should == "Email Address"
    end

    it "adds validators to fields" do
      subject.fields[:email].validators.should include EmailValidator
    end
  end

  describe '.add' do
    before { add_sample_field(subject, :first_name) }
    it 'adds the field' do
      subject.should include :first_name
    end
  end

  describe '.clear!' do
    before do
      add_sample_field(subject, :first_name)
      add_sample_field(subject, :last_name)
    end

    it "removes all fields" do
      subject.should include :first_name
      subject.should include :last_name

      subject.clear!

      subject.should_not include :first_name
      subject.should_not include :last_name
    end
  end

  describe '.remove' do
    before do
      add_sample_field(subject, :first_name)
      add_sample_field(subject, :last_name)
    end

    context "with key" do
      it "removes the given field" do
        subject.should include :first_name
        subject.should include :last_name

        subject.remove(:first_name)

        subject.should_not include :first_name
        subject.should include :last_name
      end
    end

    context "with field" do
      it "removes the given field" do
        field = DynamicFields::Field.new(:first_name)

        subject.should include :first_name
        subject.should include :last_name

        subject.remove field

        subject.should_not include :first_name
        subject.should include :last_name
      end
    end
  end
end