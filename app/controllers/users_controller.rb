class UsersController < ApplicationController
  def new
    @identity = request.env['omniauth.identity'] || Identity.new
  end

  def confirm
    identity = Identity.find_by_confirmation_code(params[:id])
    redirect_to root_path and return unless identity

    identity.confirm!
    self.current_user = identity.user
    redirect_to root_path
  end
end
