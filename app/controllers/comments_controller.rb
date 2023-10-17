class CommentsController < ApplicationController
  #todo BASIC認証---
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # @article.commentsに対してcreateメソッドを実行することで、コメントの作成と保存を同時に行っています
    #? new + saveメソッドと使い分ける
    redirect_to article_path(@article)
    # article_path(@article)ヘルパーを用いて元の記事の画面に戻ります。既に説明したように、このヘルパーを呼び出すとArticlesControllerのshowアクションが呼び出され、show.html.erbテンプレートがレンダリングされます。
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
