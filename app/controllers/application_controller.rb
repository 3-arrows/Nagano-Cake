class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when Owner
            owner_home_top_path
        when Member
            root_path
        end
    end

    def after_sign_out_path_for(resource)
        case resource
        when :owner
            new_owner_session_path
        when :member
            root_path
        end
    end

    def after_sign_up_path_for(resource)
        case resource
        when Member
            root_path
        end
    end
end