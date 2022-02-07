namespace :dev do
  desc "Pre-populate database with sample data"
  task prime: :environment do
    if Rails.env.production?
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
    end
    Log.destroy_all
    Activity.destroy_all
    User.destroy_all
    
    activities =  [ 
      {id: 1, name: "Walk", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 2, name: "Run", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 3, name: "Swim", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 4, name: "Bike", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 5, name: "Weights", created_at: 2.days.ago, updated_at: 2.days.ago},
    ]
    Activity.insert_all(activities)

    p "Activity: #{Activity.count}"

    users = [
      { name: "Alice", email: "alice@example.com" },
      { name: "Bob", email: "bob@example.com" },
      { name: "Carol", email: "carol@example.com" },
      { name: "Jane", email: "jane@example.com" },
      { name: "Riddhi", email: "riddhi@example.com" },
    ]

    users.each do |user|
      new_user = User.new(user)
      new_user.password = "password"
      new_user.save
    end
    p "Users: #{User.count}"

    user = User.first
    user.logs.create(activity_id: 3, distance: 1.3, duration: "0 h,19 m,38 s", calories: 117, started_at: "2021-10-08")
    user.logs.create(activity_id: 3, distance: 2.5, duration: "0 h,27 m,15 s", calories: 296, started_at: "2021-10-08")
    user.logs.create(activity_id: 1, distance: 0.5, duration: "0 h,10 m,47 s", calories: 93, started_at: "2021-10-09")
    user.logs.create(activity_id: 1, distance: 0.8, duration: "0 h,9 m,19 s", calories: 82, started_at: "2021-10-09")
    user.logs.create(activity_id: 1, distance: 1.2, duration: "0 h,17 m,39 s", calories: 120, started_at: "2021-10-09")
    user.logs.create(activity_id: 1, distance: 2, duration: "0 h,21 m,42 s", calories: 293, started_at: "2021-10-10")
    user.logs.create(activity_id: 1, distance: 1, duration: "0 h,10 m,10 s", calories: 110, started_at: "2021-10-10")
    user.logs.create(activity_id: 1, distance: 0.3, duration: "0 h,5 m,00 s", calories: 236, started_at: "2021-10-10")
    user.logs.create(activity_id: 1, distance: 1, duration: "0 h,13 m,10 s", calories: 193, started_at: "2021-10-10")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,4 m,30 s", calories: 73, started_at: "2021-10-14")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,7 m,09 s", calories: 68, started_at: "2021-10-14")

    user = User.second
    user.logs.create(activity_id: 2, distance: 1.1, duration: "0 h,10 m,08 s", calories: 65, started_at: "2021-10-06")
    user.logs.create(activity_id: 2, distance: 1.2, duration: "0 h,10 m,18 s", calories: 78, started_at: "2021-10-06")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,8 m,13 s", calories: 100, started_at: "2021-10-09")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,7 m,02 s", calories: 93, started_at: "2021-10-09")
    user.logs.create(activity_id: 2, distance: 1, duration: "0 h,10 m,02 s", calories: 140, started_at: "2021-10-09")
    user.logs.create(activity_id: 1, distance: 3, duration: "0 h,30 m,00 s", calories: 270, started_at: "2021-10-12")
    user.logs.create(activity_id: 1, distance: 4.7, duration: "0 h,49 m,03 s", calories: 469, started_at: "2021-10-12")
    user.logs.create(activity_id: 3, distance: 0.9, duration: "0 h,10 m,20 s", calories: 64, started_at: "2021-10-12")
    user.logs.create(activity_id: 3, distance: 0.85, duration: "0 h,10 m,14 s", calories: 59, started_at: "2021-10-12")
    user.logs.create(activity_id: 4, distance: 0.9, duration: "0 h,9 m,13 s", calories: 70, started_at: "2021-10-15")
    user.logs.create(activity_id: 4, distance: 1.1, duration: "0 h,11 m,41 s", calories:46, started_at: "2021-10-15")

    user = User.third
    user.logs.create(activity_id: 1, distance: 2.6, duration: "0 h,29 m,49 s", calories: 230, started_at: "2021-10-01")
    user.logs.create(activity_id: 1, distance: 3, duration: "0 h,40 m,19 s", calories: 396, started_at: "2021-10-01")
    user.logs.create(activity_id: 2, distance: 2.7, duration: "0 h,30 m,14 s", calories: 214, started_at: "2021-10-07")
    user.logs.create(activity_id: 2, distance: 1.2, duration: "0 h,10 m,40 s", calories: 76, started_at: "2021-10-07")
    user.logs.create(activity_id: 1, distance: 0.4, duration: "0 h,6 m,13 s", calories: 41, started_at: "2021-10-07")
    user.logs.create(activity_id: 3, distance: 0.2, duration: "0 h,1 m,41 s", calories: 14, started_at: "2021-10-12")
    user.logs.create(activity_id: 3, distance: 0.9, duration: "0 h,9 m,52 s", calories: 30, started_at: "2021-10-12")
    user.logs.create(activity_id: 2, distance: 1, duration: "0 h,10 m,21 s", calories: 72, started_at: "2021-10-12")
    user.logs.create(activity_id: 2, distance: 1.1, duration: "0 h,13 m,13 s", calories: 81, started_at: "2021-10-12")
    user.logs.create(activity_id: 4, distance: 1.5, duration: "0 h,15 m,14 s", calories: 99, started_at: "2021-10-15")
    user.logs.create(activity_id: 4, distance: 3.2, duration: "0 h,50 m,38 s", calories: 456, started_at: "2021-10-15")

    user = User.fourth
    user.logs.create(activity_id: 2, distance: 10, duration: "0 h,10 m,08 s", calories: 40, started_at: "2021-10-01")
    user.logs.create(activity_id: 2, distance: 10, duration: "0 h,17 m,12 s", calories: 65, started_at: "2021-10-01")
    user.logs.create(activity_id: 1, distance: 30, duration: "0 h,8 m,41 s", calories: 39, started_at: "2021-10-17")
    user.logs.create(activity_id: 1, distance: 30, duration: "0 h,15 m,12 s", calories: 72, started_at: "2021-10-17")
    user.logs.create(activity_id: 3, distance: 10, duration: "0 h,16 m,36 s", calories: 88, started_at: "2021-10-17")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,11 m,34 s", calories: 63, started_at: "2021-10-22")
    user.logs.create(activity_id: 2, distance: 2.5, duration: "0 h,27 m,28 s", calories: 	296, started_at: "2021-10-22")
    user.logs.create(activity_id: 5, distance: nil, duration: "0 h,19 m,17 s", calories: 186, started_at: "2021-10-22")
    
    p "logs: #{Log.count}"
  end
end
