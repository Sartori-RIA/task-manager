# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskContent, type: :model do
  describe '#validates' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe '#associations' do
    it { is_expected.to belong_to(:task) }
  end
end
