# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#validates' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, in_progress: 1, completed: 2, failed: 3) }
  end

  describe '#associations' do
    it { is_expected.to belong_to(:user).required }
    it { is_expected.to have_one(:task_content).dependent(:delete) }
  end
end
