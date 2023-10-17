#? Railsの「concern（関心事）」とは、大規模なコントローラやモデルの理解や管理を楽にする手法の1つです。複数のモデル（またはコントローラ）が同じ関心を共有していれば、concernを介して再利用できるというメリットもあります。
#? 1件のブログ記事はさまざまなステータスを持つ可能性があります。たとえば記事の可視性について「誰でも見てよい（public）」「著者だけに見せる（private）」というステータスを持つかもしれませんし、「復旧可能な形で記事を非表示にする（archived）」ことも考えられます。コメントについても同様に可視性やアーカイブを設定することもあるでしょう。こうしたステータスを表す方法の１つとして、モデルごとにstatusカラムを持たせるとしましょう。
class AddStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string
  end
end
