require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:zip) }
  end
end
