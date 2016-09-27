# Clear Database

#TODO: fix bug that doesn't allow users to be destroyed due to registration ref
Registration.destroy_all
User.destroy_all
Workshop.destroy_all
Location.destroy_all

User.create(name: 'Admin User', email: 'admin@web.com', password: 'password', password_confirmation: 'password', admin: true)
Location.create(name: 'Tree of Life Birth Center', address: '617 Saxony Place, Encinitas, CA 92302')
Workshop.create(subject: 'sleep', time: Time.now, limit: 15, location: Location.first)

puts "created #{User.count} users!"
puts "created #{Location.count} locations!"
puts "created #{Workshop.count} workshops!"
