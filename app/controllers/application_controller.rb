class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

  protected
  def after_sign_in_path_for(resource)  # ログイン後に遷移するpathを設定
    flash[:notice] = "ログインに成功しました"
    root_path(resource)
  end

  def after_sign_out_path_for(resource)  # ログアウト後に遷移するpathを設定
    flash[:notice] = "ログアウトしました"
    root_path(resource)
  end

  def after_sign_up_path_for(resource)  # サインアップ後に遷移するpathを設定
    flash[:notice] = "登録ありがとうございます！"
    root_path(resource)
  end

end
