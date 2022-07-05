
# copiato qui: http://snippets.dzone.com/posts/show/3393
# dumpa il ENV corrente verso fixtures!
# Usage: 
#    rake db:fixtures:dump

namespace :db do
  namespace :fixtures do
    
    desc 'Create YAML test fixtures from data in an existing database. Defaults to development database.  Set RAILS_ENV to override.'
    
    task :dump => :environment do
      sql  = "SELECT * FROM `%s`"
      skip_tables = ["schema_info"]
      ActiveRecord::Base.establish_connection( RAILS_ENV )
      (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
        i = "000"
        puts "DEB: Migrating table: #{table_name}"
        File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
          data = ActiveRecord::Base.connection.select_all(sql % table_name)
          file.write data.inject({}) { |hash, record|
            hash["#{table_name}_#{i.succ!}"] = record
            hash
          }.to_yaml
        end # File.open
      end
    end
  end
end


