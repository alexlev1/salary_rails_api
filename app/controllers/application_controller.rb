class ApplicationController < ActionController::API
  before_action :authorize

  private

  def authorize
    token = params[:token]
    @current_user = User.where(authentication_token: token).first

    if !@current_user
      render json:{error: 'unauthorized'}, status: :unauthorized
    end
  end
end
