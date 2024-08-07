# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
