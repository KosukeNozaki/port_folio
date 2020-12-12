class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	  # ログイン後のリダイレクト先
#   def after_sign_in_path_for(resource)
#     redirect_to root_path
#   end
# #ログアウト後のリダイレクト先
#   def after_sign_out_path_for(resource)
#     redirect_to root_path
#   end
def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :postal_code, :address, :telephone_number])
	end
end
