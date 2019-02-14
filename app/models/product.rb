class Product < ApplicationRecord
	attachment :product_image

	belongs_to :user

	has_many :reviews, dependent: :destroy

	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

    def reviewed_by?(user)
    	reviews.where(user_id: user.id).exists?
    end

    def average_reviews (product)
    	@average_reviews = reviews.average(:review_star)
	end

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Product.where(['product_name LIKE ?', "%#{search}%"])
    else
      Product.all #全て表示。
    end
  end

end
