class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  attr_accessible :name , :email, :password, :password_confirmation, :remember_me, :confirmed_at, :admin,
                  :confirmation_token, :locale, :style_id
  has_many :audios
  belongs_to :styles

  has_reputation :votes, source: {reputation: :votes, of: :audios}, aggregated_by: :sum

  has_many :evaluations, class_name: ReputationSystem::Evaluation, as: :source

  def voted_for?(audio)
    evaluations.where(target_type: audio.class, target_id: audio.id).present?
  end

end
