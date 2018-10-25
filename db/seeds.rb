require 'faker'

10.times do |city|
  city = City.create(name: Faker::Address.city)

  1.times do |specialty|
    specialty = Specialty.create(name: Faker::Gender.binary_type)

    1.times do |doctor|
      doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city.id, postal_code: Faker::Address.zip_code)

      1.times do |patient|
        patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city.id)

        1.times do |appointment|
          appointment = Appointment.create(date: Faker::Date.between(2.days.ago, Date.today), doctor_id: doctor.id, patient_id: patient.id, city_id: city.id)
        end
      end
    end
  end
end

Doctor.all.each do |doctory|
  doctory.specialties.push(Specialty.all.sample)
  doctory.save
end

Specialty.all.each do |specialty2|
  specialty2.doctors.push(Doctor.all.sample)
  specialty2.save
end
