RSpec.configure do |run|
  run.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate
  end

  run.around(:example, :db) do |example|
    DB.transaction(rollback: :always) { example.run }
  end
end
