require 'rails_helper'

RSpec.describe User::Admin, type: :model do
  let(:admin) { create(:admin) }
  describe '#welcome_message' do
    subject { admin.welcome_message }
    it { is_expected.to eq 'welcome admin' }
  end
end
