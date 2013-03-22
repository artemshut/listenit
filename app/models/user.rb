class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name , :email, :password, :password_confirmation, :remember_me, :confirmed_at, :admin,
                  :confirmation_token, :locale, :style_id


  acts_as_ferret :fields => ['name']
  has_many :audios
  belongs_to :styles

end
