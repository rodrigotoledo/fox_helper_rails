# frozen_string_literal: true

module Api
  class SessionsController < ActionController::API
    include Api::Authentication
    def create
      puts "Creating session"
      user = User.find_by(email_address: params[:email])
      if user&.authenticate(params[:password])
        token = login(user)
        render json: {user: user.attributes.except("password_digest"), token: token}, status: :created
      else
        head :unprocessable_entity
      end
    end

    def destroy
      logout current_user
      head :no_content
    end
  end
end
