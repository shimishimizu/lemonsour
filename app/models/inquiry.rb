class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :presence => {:message => '名前を入力してください。'}
  validates :email,  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'メールアドレスが有効でありません。'}, :presence => {:message => 'メールアドレスを入力してください。'}
end