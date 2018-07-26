require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'name validation' do
    context 'with right data' do
      let(:task) { Task.new(name: 'test_name', description: 'test_description') }
      it { expect(task).to be_valid }
    end

    context 'with right data' do
      let(:task) { Task.new(name: '', description: 'test_description') }
      it { expect(task).to_not be_valid }
    end
  end

  describe 'description validation' do
    context 'with right data' do
      let(:task) { Task.new(name: 'test_name', description: 'test_description') }
      it { expect(task).to be_valid }
    end

    context 'with right data' do
      let(:task) { Task.new(name: 'test_name', description: '') }
      it { expect(task).to_not be_valid }
    end
  end

end
