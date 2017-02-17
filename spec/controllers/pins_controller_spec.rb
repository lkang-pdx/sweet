require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:pin) { create(:pin) }
  let(:pin2) { create(:pin) }

  before do
    sign_in user
  end

  describe "GET index" do
    it "returns http success" do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, params: { user_id: user.id, id: pin.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { user_id: user.id, id: pin.id }
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "increases the number of Pin by 1" do
      expect{post :create, params: {user_id: user.id, pin: attributes_for(:pin) }}.to change(Pin,:count).by(1)
    end

    it "assigns the new pin to @pin" do
      post :create, params: {user_id: user.id, pin: {description: pin.description}}
      expect(assigns(:pin)).to eq Pin.last
    end

    it "redirects to pins index" do
      post :create, params: {user_id: user.id, pin: {description: pin.description}}
      expect(response).to redirect_to pins_path
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { user_id: user.id, id: pin.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { user_id: user.id, id: pin.id }
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    it "redirects to pins index" do
      get :edit, params: { user_id: user.id, id: pin.id }
      expect(response).to redirect_to pins_path
    end
  end

  describe "PUT update" do
    it "redirects to pins index" do
      new_description = pin2.description

      put :update, params: { user_id: user.id, id: pin2.id, pin: {description: new_description} }
      expect(response).to redirect_to pins_path
    end
  end

  describe "DELETE destroy" do
    it "redirects to pins index" do
      delete :destroy, params: { user_id: user.id, id: pin.id }
      expect(response).to redirect_to pins_path
    end
  end
end
