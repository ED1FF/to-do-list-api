require 'rails_helper'

RSpec.describe User::Manager, type: :model do
  let(:manager) { create(:manager) }
  describe '#welcome_message' do
    subject { manager.welcome_message }
    it { is_expected.to eq 'welcome manager' }
  end
end
