# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  City.create(
    name: Faker::Address.city
    )
  Doctor.create(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
      postal_code: Faker::Address.postcode,
      city_id: rand(City.first.id..City.last.id)
    )
  Patient.create(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     city_id: rand(City.first.id..City.last.id)
   )
  Appointment.create(
    date: Faker::Date.forward(23),
    patient_id: rand(Patient.first.id..Patient.last.id),
    doctor_id: rand(Doctor.first.id..Doctor.last.id),
    city_id: rand(City.first.id..City.last.id)

  )
  Specialty.create(
      name: Faker::Esport.game
      )
end

Doctor.all.each do |doctor|
  doctor.specialties.push(Specialty.all.sample)
  doctor.save
end

# give each assembly a random part
Specialty.all.each do |specialty|
  specialty.doctors.push(Doctor.all.sample)
  specialty.save
end
