class Styles < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :style_name
  has_many :users

end