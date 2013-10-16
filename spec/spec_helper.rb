require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

$: << File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))

require 'rspec'
require 'dynamic_fields'

HELPERS = File.join(File.dirname(__FILE__), "helpers")
Dir[ File.join(HELPERS, "*.rb") ].sort.each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
