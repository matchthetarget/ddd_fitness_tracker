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
    user.logs.create(activity_id: 3, distance: 20, duration: 3, calories: 10, started_at: "2021-10-08")
    user.logs.create(activity_id: 3, distance: 20, duration: 3, calories: 10, started_at: "2021-10-08")
    user.logs.create(activity_id: 13, distance: 10, duration: 5, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 13, distance: 10, duration: 5, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 13, distance: 10, duration: 5, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 16, distance: 20, duration: 3, calories: 10, started_at: "2021-10-10")
    user.logs.create(activity_id: 16, distance: 20, duration: 3, calories: 10, started_at: "2021-10-10")
    user.logs.create(activity_id: 18, distance: 25, duration: 4, calories: 10, started_at: "2021-10-10")
    user.logs.create(activity_id: 18, distance: 25, duration: 3, calories: 10, started_at: "2021-10-10")
    user.logs.create(activity_id: 5, distance: nil, duration: 3, calories: 10, started_at: "2021-10-14")
    user.logs.create(activity_id: 5, distance: nil, duration: 3, calories: 10, started_at: "2021-10-14")

    user = User.second
    user.logs.create(activity_id: 2, distance: 25, duration: 3, calories: 10, started_at: "2021-10-06")
    user.logs.create(activity_id: 2, distance: 25, duration: 3, calories: 10, started_at: "2021-10-06")
    user.logs.create(activity_id: 25, distance: 30, duration: 3, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 25, distance: 30, duration: 3, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 12, distance: 10, duration: 5, calories: 10, started_at: "2021-10-09")
    user.logs.create(activity_id: 16, distance: 20, duration: 3, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 16, distance: 20, duration: 3, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 10, distance: 25, duration: 2, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 10, distance: 25, duration: 2, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 17, distance: 15, duration: 3, calories: 10, started_at: "2021-10-15")
    user.logs.create(activity_id: 17, distance: 15, duration: 3, calories: 10, started_at: "2021-10-15")

    user = User.third
    user.logs.create(activity_id: 27, distance: 10, duration: 3, calories: 10, started_at: "2021-10-01")
    user.logs.create(activity_id: 27, distance: 10, duration: 3, calories: 10, started_at: "2021-10-01")
    user.logs.create(activity_id: 2, distance: 30, duration: 3, calories: 10, started_at: "2021-10-07")
    user.logs.create(activity_id: 2, distance: 30, duration: 3, calories: 10, started_at: "2021-10-07")
    user.logs.create(activity_id: 11, distance: 10, duration: 5, calories: 10, started_at: "2021-10-07")
    user.logs.create(activity_id: 14, distance: 20, duration: 3, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 14, distance: 20, duration: 3, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 12, distance: 25, duration: 2, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 12, distance: 25, duration: 2, calories: 10, started_at: "2021-10-12")
    user.logs.create(activity_id: 26, distance: 15, duration: 5, calories: 10, started_at: "2021-10-15")
    user.logs.create(activity_id: 26, distance: 15, duration: 5, calories: 10, started_at: "2021-10-15")

    user = User.fourth
    user.logs.create(activity_id: 7, distance: 10, duration: 3, calories: 10, started_at: "2021-10-01")
    user.logs.create(activity_id: 7, distance: 10, duration: 3, calories: 10, started_at: "2021-10-01")
    user.logs.create(activity_id: 16, distance: 30, duration: 2, calories: 10, started_at: "2021-10-17")
    user.logs.create(activity_id: 16, distance: 30, duration: 2, calories: 10, started_at: "2021-10-17")
    user.logs.create(activity_id: 13, distance: 10, duration: 5, calories: 10, started_at: "2021-10-17")
    user.logs.create(activity_id: 18, distance: 40, duration: 3, calories: 10, started_at: "2021-10-22")
    user.logs.create(activity_id: 18, distance: 40, duration: 3, calories: 10, started_at: "2021-10-22")
    user.logs.create(activity_id: 19, distance: 25, duration: 3, calories: 10, started_at: "2021-10-22")
    user.logs.create(activity_id: 19, distance: 25, duration: 3, calories: 10, started_at: "2021-10-22")
    user.logs.create(activity_id: 21, distance: 15, duration: 5, calories: 10, started_at: "2021-10-25")
    user.logs.create(activity_id: 21, distance: 15, duration: 4, calories: 10, started_at: "2021-10-25")
    
    user = User.fifth
    user.logs.create(activity_id: 6, distance: 10, duration: 3, calories: 10, started_at: "2021-10-31")
    user.logs.create(activity_id: 6, distance: 10, duration: 3, calories: 10, started_at: "2021-10-31")
    user.logs.create(activity_id: 6, distance: 10, duration: 3, calories: 10, started_at: "2021-10-31")

    p "logs: #{Log.count}"
  end
end
