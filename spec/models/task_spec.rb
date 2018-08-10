require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }
  let(:comment_attributes) { attributes_for(:comment) }

  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe "nested atributes for comments" do
    context 'create comment' do
      it { expect { task.update(comments_attributes: [comment_attributes]) }.to change(task.comments, :count).by(1) }
    end
  end
end
