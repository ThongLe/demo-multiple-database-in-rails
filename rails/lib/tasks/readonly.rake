namespace :readonly do
  namespace :db do
    migration_path = Rails.root.to_s + '/db/migrate'

    desc 'Create the Readonly database'
    task create: :environment do
      db_config = ActiveRecord::Base.configurations["readonly_#{Rails.env}"]
      ActiveRecord::Tasks::DatabaseTasks.create(db_config)
    end

    desc 'Migrate the Readonly database'
    task migrate: :environment do
      ActiveRecord::Base.establish_connection("readonly_#{Rails.env}".to_sym)
      ActiveRecord::Migrator.migrate(migration_path)
    end

    desc 'Rollback the Readonly database'
    task rollback: :environment do
      ActiveRecord::Base.establish_connection("readonly_#{Rails.env}".to_sym)
      ActiveRecord::Migrator.rollback(migration_path)
    end

    # Additional tasks for db:drop, db:seed, db:schema:load
  end
end
