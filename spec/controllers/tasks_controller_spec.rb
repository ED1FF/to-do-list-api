require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { create(:task) }
  let(:valid_params) { attributes_for(:task) }
  let(:invalid_params) { { name: '', description: '' } }

  describe "#index" do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe "#show" do
    context 'with valid id' do
      subject { get :show, params: { id: task.id } }

      it { is_expected.to serialize_object(task).with(TaskSerializer) }
      it { is_expected.to have_http_status(:ok) }
    end

    context 'with invalid id' do
      subject { get :show, params: { id: rand(1000) } }

      it { is_expected.to have_http_status(:not_found) }
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: task.id } }

    it { is_expected.to have_http_status(:accepted) }
    it { expect { delete :destroy, params: { id: task.id } }.to change(Task, :count).by(-1) }
  end

  describe '#update' do
    context 'with incorect params' do
      subject { patch :update, params: { id: task.id , task: valid_params } }

      it { is_expected.to have_http_status(:accepted) }
      context 'update columns' do
        before do
          subject
          task.reload
        end

        it { expect(task.name).to eq(valid_params[:name])  }
      end
    end

    context 'with incorect params' do
      subject { patch :update, params: { id: task.id , task: invalid_params } }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end

  describe '#create' do
    context 'with incorect params' do
      subject { post :create, params: { task: valid_params } }

      it { is_expected.to have_http_status(:created) }
    end

    context 'with incorect params' do
      subject { post :create, params: { task: invalid_params } }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
