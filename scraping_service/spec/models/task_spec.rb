# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#validates' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w[pending in_progress completed failed]) }
  end

  describe '#associations' do
    it { is_expected.to belong_to(:user).required }
    it { is_expected.to have_one(:user).dependent(:delete) }
  end
end
