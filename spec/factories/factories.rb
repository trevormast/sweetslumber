FactoryGirl.define do
  factory :location do
    name 'New Location'
    address '123 New st. New City, NS 12345'
  end

  factory :user do
    email 'new@user.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :admin do
    email 'new@admin.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :workshop do
    location

    subject 'New Class'
    time Time.now
    limit 20
  end

  factory :registration do
    user
    workshop
  end

  factory :questionaire do
    baby_name 'baby'
    baby_dob DateTime.now
    nap_location 'crib'
    night_location 'crib'
    desired_sleep_location 'crib'
    nap_routine 'none'
    night_routine 'none'
    naps_per_day 2
    bedtime Time.now
    sleep_obstacle 'none'
    nightwakings 2
    sleep_goal 'none'
    referred_by 'no one'
  end
end
