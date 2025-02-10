#!/usr/bin/ruby

require './lib/models'
require './lib/service'
require 'time'

cmd = ARGV[0]
service = Reminder::Service::ReminderService.new

case cmd
when "--add"
    STDERR.puts "\Invalid nubmber of arguments: \nExpected: 3\n Founded: #{ARGV.length}" unless ARGV.length >= 3
    
    description = ARGV[1]
    timestamp = ARGV[2]
  
    begin
        timestamp = Time.parse(timestamp)

        if timestamp <= Time.now
            STDERR.puts "The remind can not be defined before now."
        end
    rescue ArgumentError
        STDERR.puts "Invalid timestamp format. Expected format: YYYY-MM-DDTHH:MM:SS or HH:MM\n"
    end

    remind = Reminder::Models::Remind.new(description, timestamp)
    service.save(remind)
when "--list-all"
    puts service.list_all
when "--delete"
    raise ArgumentError.new("\nInvalid number of arguments: \nExpected: 2\n Founded: 1") unless ARGV.length >= 2

    remind_id = ARGV[1]
    result = service.delete(remind_id.to_i)

    if result == -1
        STDERR.puts "The ID of the entity to be delete does not correspond about any reminds."
    end
when "--delete-all"
    while true
        puts "Are you sure? (y/n): "
        
        ARGV.clear # For some reason the gets is interacting with the --delete-all argument, so just clear the array to avoid it
        
        ans = gets.chomp.downcase

        if ans != "y" && ans != "n"
            p ans
            STDERR.puts "\nBad answer buddy"
            next
        end

        service.delete_all
        break
    end
else
    STDERR.puts "Invalid operation."
end


Reminder::Service::destroy