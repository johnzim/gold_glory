Factory.define :user do |user|
  user.name                  "Hans Blix"
  user.email                 "awwwmaaaaan@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end


Factory.sequence :email do |n|
  "person-#{n}@example.com"
end


Factory.define :spampost do |spampost|
  spampost.content "Foo bar"
  spampost.association :user
end

Factory.define :athlete do |athlete|
  athlete.age 20
  athlete.height 120
  athlete.weight 100
  athlete.skill 2
  athlete.association :user
end
