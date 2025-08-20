# frozen_string_literal: true

def truncate_db
  ActiveRecord::Base.connection.disable_referential_integrity do
    tables = ActiveRecord::Base.connection.tables - %w[ar_internal_metadata schema_migrations]
    tables.each do |table|
      if ActiveRecord::Base.connection.adapter_name.downcase.include?('sqlite')
        ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
        # Reset auto-increment for SQLite
        ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{table}';")
      else
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} CASCADE;")
      end
    end
  end
end
