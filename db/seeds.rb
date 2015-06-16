require 'faker'

#Create RegisteredApplications
50.times do
  RegisteredApplication.create!(
    name: Faker::Internet.domain_name,
    url: Faker::Internet.url
  ) 
end
registered_applications = RegisteredApplication.all

#Create Events
100.times do
  Event.create!(
    name: Faker::Lorem.name, 
    registered_application: registered_applications.sample
  )
end

puts "Seed finished"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"