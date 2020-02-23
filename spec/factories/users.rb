FactoryBot.define do
  factory :user do
    uid  { '1235996540' }
    token { ENV['LINDA_TOKEN'] }
    display_name { 'Linda Le' }
    refresh_token { ENV['LINDA_REFRESH_TOKEN'] }
  end
end