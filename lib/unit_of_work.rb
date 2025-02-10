require_relative "models"
require "sqlite3"

module Reminder
  module UnitOfWork
    # This is a call to guarantee that all input buffers, calls, open connections and
    # anything that sqlite3 lib uses to communicate with the database be destroyed or
    # finalized
    def self.destroy
      db = SQLite3::Database.open("reminder.db")
      db.close unless db.closed?
    end

    class UnitOfWork
      def initialize
        @db = nil
        start
      end

      def save_remind(remind)
        Reminder::Utils.check_remind_parameter(remind)
        
        @db.execute <<-SQL
          INSERT INTO reminds
          (description, timestamp)
          VALUES
          (\'#{remind.description}\', \'#{remind.timestamp}\');
        SQL
      end

      def delete(id)
        Reminder::Utils.check_id_parameter(id)

        remind = @db.execute <<-SQL
          SELECT * FROM reminds
          WHERE ID = '#{id}'
        SQL

        if remind.length == 0
          return -1
        end

        @db.execute <<-SQL
          DELETE FROM reminds
          WHERE ID = '#{id}'
        SQL
      end

      def delete_all
        @db.execute("DELETE FROM reminds")
      end
      
      def list_reminds
        result_set = @db.execute("SELECT * FROM reminds")

        result_set
      end
      
      private

      def start
        # The default behavior for SQlite3 lib does not replace the existent database
        if File.exist?("reminder.db")
          @db = SQLite3::Database.open "reminder.db"
        else
          # create the database file and add the reminds table
          @db = SQLite3::Database.new "reminder.db"
          create_database_tables
        end
      end

      def create_database_tables
        @db.execute <<-SQL
            CREATE TABLE IF NOT EXISTS reminds (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            description TEXT NOT NULL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
          );
        SQL
      end
    end
  end
end
