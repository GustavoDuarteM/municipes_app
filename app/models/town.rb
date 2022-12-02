# frozen_string_literal: true

class Town < ApplicationRecord
  has_many :citizens
end
