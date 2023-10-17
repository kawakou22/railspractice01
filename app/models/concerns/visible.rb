#? APIドキュメントのActiveSupport::Concernには、以下のようにバリデーションをシンプルにincludedする方法が紹介されています。
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # concernにはクラスメソッドも追加できます。
  class_methods do
    def public_count
      where(status: 'public').count
      # ステータスをpublicの記事（またはコメント）の件数をメインページに表示したい場合
    end
  end

  def archived?
    status == 'archived'
  end
end