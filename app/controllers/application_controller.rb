class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

    def authenticate_pokeviewer(login, token)
      user = login && User.find_by_login(login)

      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(user.pokeviewer_token),
        ::Digest::SHA256.hexdigest(token))
    end

  private

    def after_sign_out_path_for(resource)
      new_session_path(resource)
    end
end
