require 'rails_helper'
require "helpers/articles_helper_spec.rb"

RSpec.describe ArticlesController, type: :controller do
  RSpec.configure do |c|
    c.include ArticlesHelper
  end

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
end
