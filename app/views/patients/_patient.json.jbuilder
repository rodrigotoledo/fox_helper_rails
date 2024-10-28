json.extract! patient, :id, :name, :email, :responsible, :phone, :responsible_phone, :address, :emergency_type, :created_at, :updated_at
json.url patient_url(patient, format: :json)
