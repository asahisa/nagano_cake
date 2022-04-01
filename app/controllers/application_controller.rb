class ApplicationController < ActionController::Base
  
  # ## ログインしてない場合、topへ
  # before_action :authenticate_user!, except: [:top, :about]
  
  
  # ## フラッシュメッセージ
  # add_flash_types :success, :info, :warning, :danger

  ## サインイン後のリダイレクト先
  # def after_sign_in_path_for(resource)
  #   about_path
  # end

  # ## サインアウト後のリダイレクト先
  # def after_sign_out_path_for(resource)
  #   "/"
  # end

end
