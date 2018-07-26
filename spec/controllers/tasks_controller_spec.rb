require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { create(:task) }
  let(:responsed_json) { JSON.parse(response.body) }
  let(:valid_params) { { name: 'test2', description: 'test2' } }
  let(:invalid_params) { { name: '', description: '' } }
  let(:random_id) { Random.new.rand(0...task.id) }


  describe "#index" do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe "#show" do
    context 'with valid id' do
      subject { get :show, params: { id: task.id } }

      it { is_expected.to have_http_status(:ok) }
      it { subject; expect(responsed_json["id"]).to eq(task.id) }
    end

    context 'with invalid id' do
      subject { get :show, params: { id: random_id } }

      it { is_expected.to have_http_status :not_found }
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: task.id } }

    it { is_expected.to have_http_status :accepted }
    it { subject; expect(controller.tasks.count).to eq(0) }
  end

  describe '#update' do
    context 'with incorect params' do
      subject { patch :update, params: { id: task.id , task: valid_params } }

      it { is_expected.to have_http_status :accepted }
      it { subject; expect(task.reload.name).to eq 'test2' }
    end

    context 'with incorect params' do
      subject { patch :update, params: { id: task.id , task: invalid_params } }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end

  describe '#create' do
    context 'with incorect params' do
      subject { post :create, params: { task: valid_params } }

      it { is_expected.to have_http_status :created }
    end

    context 'with incorect params' do
      subject { post :create, params: { task: invalid_params } }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end
end
