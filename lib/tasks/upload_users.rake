require 'csv'
require 'json'

namespace :upload_users do
  desc "TODO"
  task store_json_to_db: :environment do
    data = File.open('/Users/apple/Documents/Ruby/Practice/koans/mcl-hart-tutorial/app/assets/user.csv').read
    
    csv = CSV.new(data, :headers => true, :header_converters => :symbol, :converters => :all)
    final = csv.to_a.map {|row| row.to_hash }

    # puts final.count => 24
    # puts final => json formatted data

    # Store data in user database
    count = 0
    final.each do |single_user|
      user = User.new(single_user)
      puts user.first_name
      # puts user.last_name
      # puts user.gender
      # puts user.region
      # puts user.sub_region
      if User.find_by_first_name(user.first_name)
        count = count + 1
        puts "user already present"
        puts count
      else
        if user.save
          puts "saved new user"
        else
          puts "Some error occured"
        end
      end      
    end

    # Store the fake data in database after performing cross product to find all the possible
    # fake users as per condition
  end

end
