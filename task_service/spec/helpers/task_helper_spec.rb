# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskHelper, type: :helper do
  include described_class

  describe '#badge' do
    it 'return css class for in_progress' do
      task = build(:task, :in_progress)
      expect(badge(task)).to eq 'badge text-bg-primary'
    end

    it 'return css class for completed' do
      task = build(:task, :completed)
      expect(badge(task)).to eq 'badge text-bg-success'
    end

    it 'return css class for failed' do
      task = build(:task, :failed)
      expect(badge(task)).to eq 'badge text-bg-danger'
    end

    it 'return css class for pending' do
      task = build(:task, :pending)
      expect(badge(task)).to eq 'badge text-bg-secondary'
    end
  end
end
