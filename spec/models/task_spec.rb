require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
