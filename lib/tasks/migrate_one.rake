namespace :db do
  task :migrate_one => :environment do
    file = Dir["db/migrate/#{ENV["VERSION"]}_*.rb"].first
    require(file)
    migration_class = file.scan(
/([0-9]+)_([_a-z0-9]*).rb/)[0][1].camelize.constantize
    migration_class.migrate(:down) unless ENV["DIRECTION"] == 'up'
    migration_class.migrate(:up) unless ENV["DIRECTION"] == 'down'
  end
end
