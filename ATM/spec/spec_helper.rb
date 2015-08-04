require 'pathname'

bin_file = Pathname.new(__FILE__).realpath

$LOAD_PATH << File.expand_path('../../lib', bin_file)

require 'transaction'


RSpec.configure do |config|
	config.filter_run :focus
	config.filter_run_excluding :broken
	config.treat_symbols_as_metadata_keys_with_true_values = true
	config.run_all_when_everything_filtered = true

end