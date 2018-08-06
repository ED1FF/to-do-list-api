require 'rails_helper'

RSpec.describe BulkTasksController, type: :controller do
  let!(:user) { create(:user_with_tasks, tasks_count: 2) }
  let!(:task1) { user.tasks.first }
  let!(:task2) { user.tasks.second }
  let!(:tasks_ids) { user.tasks.pluck(:id) }
  let(:valid_session) { {Authorization: user.auth_token} }
  let(:update_params) { { done: true } }

  describe '#destroy' do
    subject { delete :destroy, params: { id: tasks_ids } }
    before { request.headers.merge!(valid_session) }

    it { is_expected.to have_http_status(:no_content) }
    it { expect { delete :destroy, params: { id: tasks_ids } }.to change(user.tasks, :count).by(-2) }
  end

  describe '#update' do
    context 'with corect params' do
      subject { patch :update, params: { id: tasks_ids }.merge(update_params) }
      before { request.headers.merge! valid_session }

      it { is_expected.to have_http_status(:accepted) }
      context 'update columns' do
        before do
          subject
          task1.reload
        end

        it { expect(task1.done).to eq(true) }
      end
    end
  end
end
