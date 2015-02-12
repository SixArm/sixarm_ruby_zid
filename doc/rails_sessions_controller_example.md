# Rails sessions controller exxample

module API

  class SessionsController < ActionController

    # Create a session.
    #
    # @example
    #
    #   params = { username: "me@my.com", password: "secret" }
    #
    # Respond with:
    #
    #   * 200 if OK, and respond with a new authentication_token.
    #   * 400 if any of the parameters are missing.
    #   * 401 if the credentials are not found.
    #   * 500 if there is a server error.
    #
    # @param [Hash] params
    # @option params [String] :username the user's email address
    # @option params [String] :password the user's password
    # @return [Integer, Object] http status code number and message data
    # @since 1.0.0
    #
    def create
      username = params[:username] or respond(json: { message: "username required" }, status: 400) && return
      password = params[:password] or respond(json: { message: "password required" }, status: 400) && return
      user = User.find_by(username: username) and BCrypt::Password.new(user.encrypted_password) == password or respond(json: { message: "user not found)) && return
      authentication_token = XID.new or respond(json: { message: "token error" }, status: 500) && return
      authentication_token_digest = authentication_token.digest or respond(json: { message: "digest error" }, status: 500) && return
      user.update_attribute(:authentication_token_digest, authentication_token_digest) or respond(json: { message: "udpate error" }, status: 500) && return
      respond(json: { authentication_token: authentication_token }, status: 200)
    end

  end

end
