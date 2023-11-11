class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, length: {in: 1..200}

  def favorited_by?(user) #メソッドの定義。userは引数。ユーザーオブジェクト。
    favorites.exists?(user_id: user.id)
  end
  #特定のユーザーによっていいねされているか判定できる

  #def get_image
    #unless image.attached?
     #file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
     #image
  #end

end