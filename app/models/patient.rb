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
end
