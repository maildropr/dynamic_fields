# DynamicFields

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'dynamic_fields'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynamic_fields

## Usage

```ruby
class Company
  include Mongoid::Document
  include DynamicFields::Mongoid::Source

  has_many :employees
end

class Employee
  include Mongoid::Document
  include DynamicFields::Mongoid::Target

  belongs_to :company
  dynamic_fields_source_relationship :company
end

company = Company.new
email_field = company.dynamic_fields.add(name: "email", label: "Email Address", required: true, unique: true)
email_field.add_validator(EmailValidator, strict: true)

company.save # Serializes dynamic fields into JSON or something

employee = company.employees.build
employee.dynamic_fields.email = "john" # or employee.email

employee.valid? # => false
employee.errors # Will include {"email" => "is invalid"} in ActiveModel::Errors
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
