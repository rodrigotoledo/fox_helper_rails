User.destroy_all
Patient.destroy_all
User.create!(email_address: 'example@example.com', password: 'password', password_confirmation: 'password')
User.create!(email_address: 'user@example.com', password: 'password', password_confirmation: 'password')

20.times do
  Patient.create!(name: Faker::Name.name_with_middle, email: Faker::Internet.email,
  responsible: Faker::Name.name_with_middle, phone: Faker::PhoneNumber.cell_phone_with_country_code,
  responsible_phone: Faker::PhoneNumber.cell_phone_with_country_code, address: Faker::Address.full_address,
  emergency_type: Patient.emergency_types.keys.sample
  )
end
