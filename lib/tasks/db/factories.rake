namespace :db do
  namespace :factories do
    desc 'Loads factories into the current environment\'s database'
    task load: :environment do
      FactoryGirl.create_list :developer, Faker::Number.between(10, 50)
    end
  end
end
