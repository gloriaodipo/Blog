module UsersHelper
  def create_user
    @user = FactoryBot.create(:user)
    post :create, params: attributes_for(:user)
  end
end
