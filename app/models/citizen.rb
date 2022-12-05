# frozen_string_literal: true

class Citizen < ApplicationRecord
  has_many :addresses

  validates :email, email: true
  validate :validate_birth_date, :validate_cpf, :validate_cns

  def validate_cpf
    errors.add(:CPF, 'invalid CPF') unless CPF.valid?(self.CPF)
  end

  def validate_birth_date
    validated_birth_date = birth_date > (Date.today - 120.years) && birth_date < Date.today
    errors.add(:birth_date, 'invalid birth_date') unless validated_birth_date
  end

  def validate_cns
    if %w[1 2].include?(self.CNS[0])
      errors.add(:birth_date, 'invalid CNS') unless valida_cns
    else
      errors.add(:birth_date, 'invalid CNS') unless valida_cns_prov
    end
  end

  private

  def valida_cns

    return false if self.CNS.strip.length != 15

    sum = 0
    result= ''
    pis = self.CNS[0..10]

    (5..15).to_a.reverse.each_with_index do |v, i|
      sum += (self.CNS[i].to_i) * v
    end

    remainder = sum % 11
    dv = 11 - remainder
    dv = 0 if dv == 11

    if dv == 10
      sum = 0
      (5..15).to_a.reverse.each_with_index do |v, i|
        sum += (self.CNS[i].to_i) * v
      end
      sum += 2

      remainder = sum % 11
      dv = 11 - remainder
      result = "#{pis}001#{dv.to_i}"
    else
      result = "#{pis}000#{dv.to_i}"
    end

    self.CNS == result
  end

  def valida_cns_prov

    return false if self.CNS.strip.length != 15

    sum = 0

    (1..15).to_a.reverse.each_with_index do |v,i| 
      sum += (self.CNS[i].to_i) * v
    end

    remainder = sum % 11
    remainder == 0
  end
end
