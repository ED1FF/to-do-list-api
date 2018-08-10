require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:email) { Faker::Internet.email }
  let!(:user) { create(:user) }
  let!(:user_with_address) { create(:user, addresses_attributes: [addresses_attributes]) }
  let!(:address) { user_with_address.addresses.first }
  let!(:correct_params) { { user: { email: Faker::Internet.email, password: '123321123321', password_confirmation: '123321123321' } } }
  let!(:incorrect_params) { { user: { email: '', password: '', password_confirmation: '' } } }
  let!(:user_params_with_address) { { user: { email: Faker::Internet.email, password: '123321123321', password_confirmation: '123321123321',addresses_attributes: [addresses_attributes] } } }
  let(:user_update_params) { { id: user.id, user: { email: email } } }
  let(:user_address_params) { { id: user.id, user: { addresses_attributes: [addresses_attributes] } } }
  let(:addresses_attributes) { attributes_for(:address) }
  let(:addresses_destroy_attr) { {id: address.id, _destroy: true } }
  let(:destroy_address) { { id: user_with_address.id, user: { addresses_attributes: [addresses_destroy_attr] } }  }

  describe '#create' do
    context 'with correct credentials' do
      subject { post :create, params: correct_params }
      it { is_expected.to have_http_status(:created) }
    end
    context 'with incorect credentials' do
      subject { post :create, params: incorrect_params }
      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
    context 'with address' do
      subject { post :create, params: user_params_with_address }
      it { is_expected.to have_http_status(:created) }
      it { expect { post :create, params: user_params_with_address }.to change(Address, :count).by(1) }
    end
  end

  describe '#show' do
    subject { get :show, params: { id: user.id } }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#update' do
    context 'update user' do
      subject { patch :update, params: user_update_params }
      it { is_expected.to have_http_status(:accepted) }
    end
    context 'update address' do
      subject { patch :update, params: user_address_params }
      it { is_expected.to have_http_status(:accepted) }
    end
    context 'delete address' do
      it { expect { patch :update, params: destroy_address }.to change(Address, :count).by(-1) }
    end
  end
end
