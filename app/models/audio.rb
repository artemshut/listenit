class Audio < ActiveRecord::Base
  attr_accessible :audio, :description, :content, :name, :tag_list
  has_attached_file :audio
  validates_attachment_presence :audio
  validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']

  acts_as_taggable
  belongs_to :user
  searchable do
    text :audio, :description, :tag_list
  end

end
