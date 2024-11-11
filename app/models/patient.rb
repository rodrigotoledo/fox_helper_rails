class Patient < ApplicationRecord
  belongs_to :user, optional: true
  enum :emergency_type, {
    cardiac_arrest: "cardiac_arrest",
    trauma: "trauma",
    stroke: "stroke",
    respiratory_failure: "respiratory_failure",
    allergic_reaction: "allergic_reaction",
    poisoning: "poisoning",
    burn: "burn",
    other: "other"
  }

  # broadcasts_refreshes

  after_create_commit do
    # the first part is the channel,
    # if you use tasks, and in the erb user turbo stream with task
    # everyone will see in the same  moment
    broadcast_append_to "patients", partial: "patients/patient", locals: {patient: self}
  end

  after_update_commit do
    broadcast_replace_to "patients", target: "patient_#{id}", partial: "patients/patient", locals: {patient: self}
  end

  after_destroy do
    broadcast_remove_to "patients", target: "patient_#{id}"
  end
end
