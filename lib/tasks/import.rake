require 'yaml'


namespace :data do
  desc "import data from files to database"
  task :import => :environment do
    config_data = YAML.load_file('config/data.yml')
    # moves
    config_data['moves'].each do |move|
      move = Move.new(move)
      begin 
        move.save!
      rescue Exception => e
        puts e
      end        
    end
  end
end


