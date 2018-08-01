require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:correct_params) { { user: { email: 'test@test.test', password: '123321123321', password_confirmation: '123321123321' } } }
  let!(:incorrect_params) { { user: { email: '', password: '', password_confirmation: '' } } }
  describe '#create' do
    context 'with correct credentials' do
      subject { post :create, params: correct_params }
      it { is_expected.to have_http_status(:created) }
    end
    context 'with incorect credentials' do
      subject { post :create, params: incorrect_params }
      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
