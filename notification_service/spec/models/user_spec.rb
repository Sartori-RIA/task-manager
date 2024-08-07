# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#associations' do
    it { is_expected.to have_many(:notifications).dependent(:delete_all) }
  end
end
