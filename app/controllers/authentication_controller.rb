class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token, user: @user }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  def register
    user = User.new(register_params)
    if user.save
      render json: { message: "user created successfully" }
    else
      render json: { message: "Please provide valid details" }, status: :unprocessable_entity
    end
  end

  private

  def register_params
    params.permit(:name, :email, :password)
  end
end
