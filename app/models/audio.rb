class Audio < ActiveRecord::Base
  attr_accessible :audio, :description, :content, :tag_list, :audio_file_name
  has_attached_file :audio
  validates_attachment_presence :audio
  validates :tag_list, :length => {:maximum => 8}
  validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
 # before_save :extract_metadata
  serialize :metadata
  acts_as_taggable
  belongs_to :user
  searchable do
    text :audio, :description, :tag_list, :audio_file_name
  end
  self.per_page = 10

end
