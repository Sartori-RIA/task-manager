# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validates' do
    it { is_expected.to validates_presence_of(:name) }
  end
end
