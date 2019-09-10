require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:new_attributes) do
    {
      username: "Gloria",
      email: "gloria@mail.com"
    }
  end

  describe "POST #create" do
    context "signup with valid attributes" do
      it "returns success status" do
        post :create, params: attributes_for(:user)
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "GET #index" do
    it "returns all users" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns one user" do
      @user = create(:user)
      get :index, params: { username: @user.username }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #index" do
    it "deletes user" do
      @user = create(:user)
      delete :index, params: { username: @user.username }
      expect(response.status).to eq(200)
    end
  end

  describe "UPDATE #update" do
    it "updates user details" do
      @user = create(:user)
      put :index, params: { username: new_attributes[:username] }
      expect(response.status).to eq(200)
    end
  end
end
