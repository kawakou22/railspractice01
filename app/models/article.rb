#todo MVCのM（model）---------------------
class Article < ApplicationRecord
  include Visible
  # VALID_STATUSES = ['public', 'private', 'archived']
  # validates :status, inclision: { in: VALID_STATUSES }
  # def archived?
  #   status == 'archived'
  # end

  has_many :comments, dependent: :destroy
  #? 1件の記事はコメントを複数持てる（One article can have many comments）。
  # 2つのモデルで行われているこれらの宣言によって、さまざまな動作が自動化されます。たとえば、@articleというインスタンス変数に記事が1件含まれていれば、@article.commentsと書くだけでその記事に関連付けられているコメントをすべて取得できます。
  #? dependent: :destroy ある記事を削除したら、その記事に関連付けられているコメントも一緒に削除する必要があります（そうしないと、コメントがいつまでもデータベース上に残ってしまいます）。
  
  #? バリデーションとは、モデルオブジェクトを保存する前に自動的にチェックするルールのことです。チェックに失敗した場合は保存を中止し、モデルオブジェクトの errors 属性に適切なエラーメッセージが追加されます。
  validates :title, presence: true
  # 「titleの値が必ず存在しなければならない」
  validates :body, presence: true, length: { minimum: 10 }
  # 「bodyの値が必ず存在しなければならない」


end
