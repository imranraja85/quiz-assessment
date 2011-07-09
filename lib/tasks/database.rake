namespace :db do
  desc "reload the db and start from scratch"
  task :reload => ["db:drop", "db:create", "db:migrate", "db:seed"]
end
