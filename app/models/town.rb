# frozen_string_literal: true

class Town < ApplicationRecord
  has_many :citizens
  has_many :addresses
end
