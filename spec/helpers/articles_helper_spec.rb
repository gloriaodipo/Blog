require "helpers/users_helper_spec.rb"

module ArticlesHelper
  RSpec.configure do |c|
    c.include UsersHelper
  end

  def create_article
    create_user
    if @current_user
      # user_id = @current_user.id
      # binding.pry
      @article = FactoryBot.create(:article)
      post :create, params: attributes_for(:article)
    end
  end
end
