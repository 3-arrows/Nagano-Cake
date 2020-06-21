class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :search
    def after_sign_in_path_for(resource)
        case resource
        when Owner
            owner_home_top_path
        when Member
            root_path
        end
    end

    def after_sign_out_path_for(resource) # 書き方が違うのはなぜ？
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

    def search
        @q = Member.ransack(params[:q])
        @members = @q.result(distinct: true)
    end

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,
           :last_name_kana, :postal_code, :prefecture_code, :city, :street, :phone_number, :email])
    end

    POSTAGE_PRICE = 800 # 送料¥800を定義
end

