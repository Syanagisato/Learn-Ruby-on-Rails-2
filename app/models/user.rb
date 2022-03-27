class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mains, dependent: :destroy, foreign_key: :main_user_id
  has_many :titles, dependent: :destroy, foreign_key: :title_user_id
  has_many :sakusyas, dependent: :destroy, foreign_key: :sakusya_user_id
  has_many :publishers, dependent: :destroy, foreign_key: :publisher_user_id

end
