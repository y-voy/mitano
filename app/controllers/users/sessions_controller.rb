class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: t('view.sign_in_as_guest')
  end

  def new_admin_guest
    user = User.admin_guest
    sign_in user
    redirect_to root_path, notice: t('view.sign_in_as_guest_admin')
  end

end
