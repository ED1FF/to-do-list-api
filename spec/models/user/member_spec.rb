require 'rails_helper'

RSpec.describe User::Member, type: :model do
  let(:manager) { create(:member) }
  describe '#welcome_message' do
    subject { manager.welcome_message }
    it { is_expected.to eq 'welcome member' }
  end
end
