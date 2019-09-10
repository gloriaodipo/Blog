require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "returns all articles" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns a single article" do
      get :index, params: { id: @article }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE Article" do
    it "deletes an artilce" do
      article = create(:article)
      delete :index, params: { id: article.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
