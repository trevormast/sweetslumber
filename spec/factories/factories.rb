FactoryGirl.define do
  factory :location do
    name 'New Location'
    address '123 New st. New City, NS 12345'
  end

  factory :user do

  end

  factory :workshop do
    location
    users

    subject 'New Class'
    time Time.now
    limit 20
  end
end
