#? マイグレーション（migration）は、アプリケーションのデータベース構造を変更するときに使われる機能です。
class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      #? create_tableメソッド呼び出しは、articlesテーブルの構成方法を指定します。create_tableメソッドは、デフォルトでidカラムを「オートインクリメントの主キー」として追加します。つまり、テーブルで最初のレコードのidは1、次のレコードのidは2、というように自動的に増加します。

      t.timestamps
      #? ブロックの末尾行はt.timestampsメソッドを呼び出しています。これはcreated_atとupdated_atという2つのカラムを追加で定義します。後述するように、これらのカラムはRailsによって自動で管理されるので、モデルオブジェクトを作成・更新すると、これらのカラムに値が自動で設定されます。
    end
  end
end
