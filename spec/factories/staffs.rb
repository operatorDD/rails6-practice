FactoryBot.define do
  factory :staff do
    email { 'test@gmail.com' }
    password { 'password' }
    family_name { '太郎' }
    given_name { '山田' }
    family_name_kana { 'タロウ' }
    given_name_kana { 'ヤマダ' }
    start_date { Date.today }
  end
end
