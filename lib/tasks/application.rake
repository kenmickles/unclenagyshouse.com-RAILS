desc "Publish static site"
task :deploy do
  puts `bash #{Rails.root}/lib/tasks/deploy.sh`
end