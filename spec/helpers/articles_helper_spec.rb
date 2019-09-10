# require "helpers/users_helper_spec.rb"

module ArticlesHelper

  def create_article
    create_user
    # if @current_user
    #   # user_id = @current_user.id
    #   # binding.pry
    @article = create(:article)
    post :create, params: attributes_for(:article)
    # end
  end
end
