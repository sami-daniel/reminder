module Reminder
  module Utils
    def self.check_remind_parameter(remind)
      error_message = "\nThe type of remind is invalid\nExpected: #{Reminder::Models::Remind}\nFounded: #{remind.class}"
      raise ArgumentError.new(error_message) unless remind.is_a?(Reminder::Models::Remind)
    end

    def self.check_id_parameter(id)
      error_message = "\nThe type of id is invalid\nExpected: #{Integer}\nFounded: #{id.class}"
      raise ArgumentError.new(error_message) unless id.is_a?(Integer)
    end
  end
end
