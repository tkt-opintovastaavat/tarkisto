namespace :tarkisto do

  task :babilu => :environment do
    I18n.reload!
    Babilu.generate
  end

end

desc 'Run all tarkisto specific tasks'
task :tarkisto => 'tarkisto:babilu'

task :default => :tarkisto
