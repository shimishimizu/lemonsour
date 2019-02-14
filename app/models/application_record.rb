class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Product.where(['product_name LIKE ?', "%#{search}%"])
    else
      Product.all #全て表示。
    end
  end
end
