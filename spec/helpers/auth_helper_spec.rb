require 'jwt'

module AuthHelper
  def authorize_user(user)
    allow(JWT).to receive(:decode).and_return(
      [
        {
          user_id: user.id,
        }
      ]
    )
  end
end
