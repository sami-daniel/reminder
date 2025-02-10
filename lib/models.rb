module Reminder
  module Models
    class Remind
      attr_accessor :id, :description, :timestamp

      def initialize(description, timestamp)
        @id = nil # Set to nil, cause the ID will be supressed when passed to save
        @description = description
        @timestamp = timestamp
      end

      def to_s
        "ID: #{@id}, Description: #{@description}, Timestamp: #{@timestamp}"
      end
    end
  end
end
