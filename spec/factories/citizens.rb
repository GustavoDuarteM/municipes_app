# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    full_name { 'Yasmin Valentina Stefany da Cruz' }
    CPF { '837.248.862-25' }
    CNS { '810600038140007' }
    email { 'yasmin-dacruz85@texfuse.com.br' }
    birth_date { '2004-07-26' }
    phone { '11994886217' }
    town { nil }
  end
end
