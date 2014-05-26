FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
  end

  factory :link do
    title "Best Link Ever"
    url "https://www.google.com"
    # user  # currently we don't have any user/link association??
  end

  factory :tag do
    name "sampletag"
  end

end