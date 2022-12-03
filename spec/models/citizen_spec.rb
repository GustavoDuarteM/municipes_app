# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe 'citizen creation' do
    let(:town) { build(:town) }
    let(:citizen) { build(:citizen, town: town) }

    context 'when the citizen has a valid data' do
      it 'valid' do
        expect(citizen).to be_valid
      end
    end

    context 'when the citizen has a invalid birth_date' do
      it 'invalid' do
        citizen.birth_date = (Date.today + 1.day)

        expect(citizen).not_to be_valid
      end
    end

    context 'when the citizen has a invalid CPF' do
      it 'invalid' do
        citizen.CPF = '837.248.861-25'

        expect(citizen).not_to be_valid
      end
    end

    context 'when the citizen has a invalid CNS' do
      it 'invalid' do
        citizen.CNS = '510600038140007'

        expect(citizen).not_to be_valid
      end
    end
  end
end
