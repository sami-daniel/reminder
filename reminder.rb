#!/usr/bin/ruby

cmd = ARGV[0]

raise ArgumentError.new 'Invalid argument for reminder' if cmd.nil?

# if argument == save: ModuleName::save(...)
# if argument == delete: ModuleName::delete(...)
# if argument == update: ModuleName::update(...)
# if argument == list: ModuleName::list(...)
# if argument == list-filtered: ModuleName::list-filtered(...)