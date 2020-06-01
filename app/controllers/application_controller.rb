class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    owner_home_top_path
  end

  def after_sign_out_path_for(resource)
    new_owner_session_path
  end
end
