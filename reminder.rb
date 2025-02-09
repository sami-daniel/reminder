#!/usr/bin/ruby

cmd = ARGV[0]

raise ArgumentError.new 'Invalid argument for reminder' if cmd.nil?

