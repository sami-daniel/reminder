require_relative "unit_of_work"
require_relative "utils"
require "time"

module Reminder
  module Service
    def self.destroy
      Reminder::UnitOfWork.destroy
    end

    class ReminderService
      def initialize
        @unit_of_work = Reminder::UnitOfWork::UnitOfWork.new

        reminds = @unit_of_work.list_reminds

        reminds.each do |remind|
          if Time.parse(remind[2]) <= Time.now
            @unit_of_work.delete(remind[0])
          end
        end
      end

      def save(remind)
        Reminder::Utils.check_remind_parameter(remind)

        @unit_of_work.save_remind(remind)
      end

      def delete(id)
        Reminder::Utils.check_id_parameter(id)

        @unit_of_work.delete(id)
      end

      def delete_all()
        @unit_of_work.delete_all
      end

      def list_all
        result = []
        dbset = @unit_of_work.list_reminds

        dbset.each do |row|
          new_remind = Reminder::Models::Remind.new(row[1], row[2])
          new_remind.id = row[0]

          result.push(new_remind)
        end

        result
      end
    end
  end
end
