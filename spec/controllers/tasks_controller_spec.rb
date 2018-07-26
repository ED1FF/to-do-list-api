require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { Task.create(name: 'test_name', description: 'test_description') }
  let(:tasks) { Task.all }
  let(:responsed_json) { JSON.parse(response.body) }

  describe "GET #index" do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe "GET #show" do
    before { get :show, params: { id: task.id } }

    it { expect(responsed_json["id"]).to eq(task.id) }
    it { expect(response).to have_http_status :ok }
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: task.id } }

    it { expect(tasks.count).to eq(0) }
    it { expect(response).to have_http_status :accepted }
  end

  describe 'PATCH #update' do
    context 'with incorect params' do
      before { patch :update, params: { id: task.id , task: { name: 'test2', description: 'test2' } } }

      it { expect(response).to have_http_status :accepted }
      it { expect(task.reload.name).to eq 'test2' } # ask
    end

    context 'with incorect params' do
      before { patch :update, params: { id: task.id , task: { name: '', description: '' } } }

      it { expect(response).to have_http_status :unprocessable_entity }
    end
  end

  describe 'POST #create' do
    context 'with incorect params' do
      before { post :create, params: { task: { name: 'test2', description: 'test2' } } }

      it { expect(response).to have_http_status :created }
    end

    context 'with incorect params' do
      before { post :create, params: { task: { name: '', description: '' } } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
