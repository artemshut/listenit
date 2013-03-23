class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  attr_accessible :name , :email, :password, :password_confirmation, :remember_me, :confirmed_at, :admin,
                  :confirmation_token, :locale, :style_id

  has_many :audios

  belongs_to :styles

end
