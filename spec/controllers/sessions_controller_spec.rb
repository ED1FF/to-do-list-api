require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:correct_params) { { email: user.email, password: '123321123321' } }
  let!(:incorrect_params) { { email: 'test@test.test', password: '123321123321' } }
  describe '#create' do
    context 'with correct credentials' do
      subject { post :create, params: correct_params }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'with incorect credentials' do
      subject { post :create, params: incorrect_params }
      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
