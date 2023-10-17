#? rails g model Comment commenter:string body:text article:references
class Comment < ApplicationRecord
  include Visible
  # VALID_STATUSES = ['public', 'private', 'archived']
  # validates :status, inclision: { in: VALID_STATUSES }
  # def archived?
  #   status == 'archived'
  # end
  # booleanを返す

  belongs_to :article
  # belongs_to :article Active Recordの関連付け（アソシエーション: association）を設定する
  #? 1件のコメントは1件の記事に属する（Each comment belongs to one article）。
end
