require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { Task.create(name: 'test_name', description: 'test_description') }
  let(:get_all_tasks) { Task.all }

  describe "GET #index" do
    before { get :index }

    it {expect(response).to have_http_status(:ok)}
  end

  describe "GET #show" do
    before { get :show, params: { id: task.id } }

    it 'resposed right task' do
      json = JSON.parse(response.body)
      expect(json["data"]["id"]).to eq(task.id)
    end

    it { expect(response).to have_http_status :ok }
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: task.id } }

    it { expect(get_all_tasks.count).to eq(0) }
    it { expect(response).to have_http_status :accepted }
  end

  describe 'PATCH #update' do
    context 'with incorect params' do
      before { patch :update, params: { id: task.id , task: { name: 'test2', description: 'test2' } } }

      it { expect(response).to have_http_status :accepted }
      # it { expect(task.name).to eq 'test2' } # ask
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

      it { expect(response).to have_http_status :unprocessable_entity }
    end
  end

end
