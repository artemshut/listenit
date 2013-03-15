class Audio < ActiveRecord::Base
  attr_accessible :audio
  has_attached_file :audio
  validates_attachment_presence :audio
  validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
  attr_accessible :content, :name, :tag_list
  acts_as_taggable
end
