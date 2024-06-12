class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  def authenticate_request
    header = request.headers["Authorization"]

    if header
      header = header.split(" ").last
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: "Empty header" }
    end
  end
end
