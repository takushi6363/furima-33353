FactoryBot.define do
  factory :user do
    nickname              {'テスト'}
    email                 {'test@test.com'}
    password              {'a000000'}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'太郎'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'タロウ'}
    birthday              {'1950-01-01'}
  end
end