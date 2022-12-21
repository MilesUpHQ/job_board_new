class RegistrationsController < Devise::RegistrationsController
    private
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation,:prefered_location)
    end
    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password,:prefered_location)
    end
  end
  
  