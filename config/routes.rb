Rails.application.routes.draw do

  ##顧客
  devise_for :customers,skip: [:passwords], controllers: {
  ##新規登録
  registrations: "public/registrations",
  ##ログイン
  sessions: 'public/sessions'
  }

  # ##管理者
  # # devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  # devise_for :admin, skip: [:passwords] ,controllers: {
  # ##ログイン
  # sessions: "admin/sessions",
  # ##新規登録
  # registrations: "public/registrations"
  # }
  
  ##顧客コントローラ
  ##URLを変更せず、ファイル構成のみ変更
  scope module: :public do

    ##トップページ
    root to: "homes#top"
    get "/home/about" => "homes#about", as: "about"

    ##customer
    ##マイページ
    get "/customers/mypage" => "customers#mypage", as: "mypage"
    ##退会の確認
    get "/customers/confrm" => "customers#confrm", as: "confrm_customer"
    ##退会ステータス
    patch "/customers/status" => "customers#status", as: "status_customer"
    ##URL内にid含めない
    resource :customers, only: [ :edit, :update ]

    ##item
    ##URL内にid含む
    resources :items, only: [ :index, :show ]

    ##cart_item
    ##カート内商品全て削除
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
    ##自動作成。URL内にid含む
    resources :cart_items, only: [ :create, :index, :update, :destroy ]

    # ##order
    ##注文確認
    post "/orders/confirm" => "/orders#confirm", as: "confirm_order"
    ##注文完了
    get "/orders/thanks" => "/orders#thanks", as: "thanks_order"
    ##URL内にid含む
    resources :orders, only: [ :new, :create, :index, :show ]

  end


  # ##管理者コントローラ
  # ##URL、ファイル構成共に変更
  # namespace :admin do

  #   ##トップページ
  #   root to: "homes#top"

  #   ##item
  #   ##自動作成。destroyのみ除外
  #   resources :items, except: [ :destroy ]

  #   ##customer
  #   ##自動作成。URL内にid含む
  #   resources :customers, only: [ :index, :show, :edit, :update ]

  #   ##order
  #   ##自動作成。URL内にid含む
  #   resources :orders, only: [ :show ]

  # end


end
