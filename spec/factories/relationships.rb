FactoryGirl.define do
  factory :relationship do
    person
    association :member, factory: :person
  end

  factory :fathership,  parent: :relationship, class: Fathership

  factory :mothership,  parent: :relationship, class: Mothership
end
