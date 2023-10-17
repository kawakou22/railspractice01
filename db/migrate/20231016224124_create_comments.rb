#? rails g model Comment commenter:string body:text article:references
#? :referencesキーワードは、モデルの特殊なデータ型を表し 、指定されたモデル名の後ろに_idを追加した名前を持つ新しいカラムをデータベーステーブルに作成します。
class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true
      # t.referencesという行は、article_idという名前のinteger型カラムとそのインデックス、そしてarticlesのidカラムを指す外部キー制約を設定します。
      t.timestamps
    end
  end
end
