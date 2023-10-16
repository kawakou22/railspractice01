class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    #? コントローラ内のインスタンス変数（@で始まる変数）は、ビューからも参照できます。つまり、app/views/articles/index.html.erbで@articlesと書くと、このインスタンス変数を参照できるということです。
  end

  def show
    @article = Article.find(params[:id])
    # この記事をデータベースから取り出したければ、そのモデルでfindメソッドを呼び出し、その記事のidを引数として渡します。
    #? showアクションは、デフォルトでapp/views/articles/show.html.erbをレンダリングします。
  end

  #? CRUDのC（Create）です
  def new
    @article = Article.new
    #? newアクションは、新しい記事を1件インスタンス化しますが、データベースには保存しません。インスタンス化された記事は、ビューでフォームをビルドするときに使われます。newアクションを実行すると、app/views/articles/new.html.erb（この後作成します）がレンダリングされます。
  end
  def create
    @article = Article.new(title: "...", body: "...")
    if @article.save
      redirect_to @article
      # その記事のページ（"http://localhost:3000/articles/#{@article.id}"）にリダイレクトします。
    else 
      render :new, status: :unprocessable_entity
   end
  # ? 記事の保存に失敗した場合は、app/views/articles/new.html.erbに戻ってフォームを再表示し、Turboが正常に動作するようにステータスコード422 Unprocessable Entityを返します（unprocessable_entity）
  end
  #? redirect_toメソッドを使うとブラウザで新しいリクエストが発生しますが、renderメソッドは指定のビューを現在のリクエストとしてレンダリングします。ここで重要なのは、redirect_toメソッドはデータベースやアプリケーションのステートが変更された「後で」呼び出すべきであるという点です。ステートが変更される前にredirect_toを呼び出すと、ユーザーがブラウザをリロードしたときに同じリクエストが再送信され、変更が重複してしまいます。

  #? Strong Parametersという機能を用いてparamsをフィルタすることにします
  private
    def article_params
      params.require(:article).permit(:title, :body)
      # requireメソッド paramsからとってくるデータのオブジェクト名を指定する。
      # paramsから取ってくるデータのキーを指定する。
    end
end
