FactoryBot.define do
  factory :favorite do
    neo_reference_id {"42"}
    user
  end
end
