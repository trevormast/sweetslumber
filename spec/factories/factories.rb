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
end
