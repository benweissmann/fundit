# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :donation do
    participation

    amount             10
    message            nil
    name               'Foo Donor'
    email              'foodonor@foocorp.net'
    is_message_private false
    is_name_private    false
    is_amount_private  false
    thank_you_sent     false
    stripe_token       'footoken'
  end
end
