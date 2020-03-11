namespace :generate_fake_users do
  desc "TODO"
  task store_fake_users_in_db: :environment do
    # User.all.each do |user|
    #   # puts user.first_name
    # end

    # sql = "select * from users"

    # SELECT distinct u1.first_name, u2.last_name, u2.gender, u2.region, u2.sub_region
    # FROM user as u1
    # INNER JOIN user as u2 ON (u1.gender=u2.gender && u1.region=u2.region);

    sql = "SELECT distinct u1.first_name, u2.last_name, u2.gender, u2.region, u2.sub_region
           FROM users as u1
           INNER JOIN users as u2 
           ON (u1.gender = u2.gender AND 
               u1.region = u2.region AND 
               u1.sub_region = u2.sub_region);"

    records_array = ActiveRecord::Base.connection.execute(sql)

    puts records_array

    puts records_array.count

    records_array.each do |row|
      puts row
    end
  end

end
