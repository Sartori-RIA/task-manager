# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validates' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#associations' do
    it { is_expected.to have_many(:notifications).dependent(:delete_all) }
    it { is_expected.to have_many(:tasks).dependent(:delete_all) }
  end
end
