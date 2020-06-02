class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    owner_home_top_path
  end

  def after_sign_out_path_for(resource)
    new_owner_session_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,
       :last_name_kana, :postal_code, :prefecture_code, :city, :street, :phone_number, :email])
  end
end
