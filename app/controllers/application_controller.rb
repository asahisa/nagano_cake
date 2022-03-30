class ApplicationController < ActionController::Base
  
  # ## ログインしてない場合、topへ
  # before_action :authenticate_user!, except: [:top, :about]
  
  ## コントローラー実行前に処理 =>  protected
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ## フラッシュメッセージ
  # add_flash_types :success, :info, :warning, :danger

  ## サインイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    about_path
  end

  ## サインアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    "/"
  end

  ## 他コントローラからも参照
  protected

  def configure_permitted_parameters
    ## ユーザー登録時, nameデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
