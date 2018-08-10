require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:text) }
  end
end
