# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#valdiates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:message) }
  end

  describe '#associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:task) }
  end
end
