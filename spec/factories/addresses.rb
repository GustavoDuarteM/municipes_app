FactoryBot.define do
  factory :address do
    CEP { "MyString" }
    street { "MyString" }
    complement { "MyString" }
    district { "MyString" }
    city { "MyString" }
    UF { "MyString" }
    IBGE { "MyString" }
    citizen { nil }
  end
end
