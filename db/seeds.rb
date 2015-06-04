require 'faker'

#Create RegisteredApplications
50.times do
  RegisteredApplication.create!(
    name: Faker::Lorem.name
  ) 
end
registered_application = RegisteredApplication.all

#Create Events
100.times do
  Event.create!(
    registered_application.sample,
    name: Faker::Lorem.name
    )
end

puts "Seed finished"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"