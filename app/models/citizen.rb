# frozen_string_literal: true

class Citizen < ApplicationRecord
  belongs_to :town
end
