class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create index show]
  before_action :find_user, except: %i[create index]

  #GET users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  #GET username
  def show
    # binding.pry
    render json: @user, status: :ok
  end

  #POST users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, message: 'User created'
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  #PUT users/username
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE users/username
  def destroy
    @user.destroy
    render json: { message: "User deleted successfully" }, status: :ok
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' },
    status: :not_found
  end

  def user_params
    params.permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
