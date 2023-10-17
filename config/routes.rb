#todo ルーティング --------------------------------
# Railsアプリケーションのコントローラへ指示を出すための道筋

Rails.application.routes.draw do
  root "articles#index"
  # root 'コントローラ名#アクション名'
  #? アプリケーションのHomeページを設定する アプリケーションのrootパスをこのコントローラとアクションに対応付けます。 rootはルートドメインにアクセスしたときに表示するページの指定です。
  #? rootルーティングがArticlesControllerのindexアクションに対応付けられたことを確認できました。

  #! get "/articles", to: "articles#index"
  # get 'パス', to: 'コントローラ名#アクション名'
  #? GET /articlesリクエストをArticlesControllerのindexアクションに対応付けます。
  #! get "/articles/:id", to: "articles#show"
  #? ルーティングパラメータは、リクエストのパスに含まれる特定の値をキャプチャして、その値をparamsというハッシュに保存します。paramsはコントローラのアクションでもアクセスできます。ArticlesControllerのshowアクションでparams[:id]と書くとアクセスできます。
  resources :articles do
    resources :comments
  end
  #? getメソッドで書かれていたルーティングをresourcesで書き換えましょう。ルーティングがどのように対応付けられているかを表示するには、bin/rails routesコマンドが使えます
  #? この設定により、articlesの内側にネストしたリソース（nested resouce）としてcommentsが作成されます。これは、モデルの記述とは別の視点から、記事とコメントの間のリレーションシップを階層的に捉えたものです。
  # article_idと表記された値はparams[:article_id]で取得することができます。
  # resources :コントローラー名, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
