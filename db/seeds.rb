# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  new_doctor = Doctor.create(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
      specialty: Faker::Book.title,
      postal_code: Faker::Address.postcode
    )
  Patient.create(
    first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name
   )
  Appointment.create(
    date: Faker::Date.forward(23),
    patient_id: rand(Patient.first.id..Patient.last.id),
    doctor_id: rand(Doctor.first.id..Doctor.last.id)

  )




  end
