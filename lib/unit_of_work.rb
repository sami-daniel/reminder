require 'sqlite3'

module Reminder
  module UnitOfWork
    class UnitOfWork
      def initialize
        @sqlitedb = nil
      end

      def start
        # Abre o banco de dados ou cria um novo, se não existir
        if File.exist?("reminder.db")
          @sqlitedb = SQLite3::Database.open 'reminder.db'
        else
          @sqlitedb = SQLite3::Database.new 'reminder.db'
          create_reminds_table
        end
      end

      private

      def create_reminds_table
        @sqlitedb.execute <<-SQL
          CREATE TABLE IF NOT EXISTS reminds (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            description TEXT NOT NULL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
          );
        SQL
        @sqlitedb.close
      end
    end
  end
end
