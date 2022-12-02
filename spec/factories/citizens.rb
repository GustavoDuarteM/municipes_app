# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    full_name { 'MyString' }
    CPF { 'MyString' }
    CNS { 'MyString' }
    email { 'MyString' }
    birth_date { '2022-12-02' }
    phone { 'MyString' }
    town { nil }
  end
end
