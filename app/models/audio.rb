class Audio < ActiveRecord::Base

  has_many :tags
  belongs_to :user
  attr_accessor :tag_list
  attr_accessible :audio, :description, :content, :tag_list, :audio_file_name, :user_id
  before_save :extract_metadata
  serialize :metadata

  has_attached_file :audio
  validates_attachment_presence :audio
  validates :tag_list, :length => {:maximum => 8}
  validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
  has_reputation :votes, source: :user, aggregated_by: :sum
  searchable do
    text :audio, :description, :tag_list, :audio_file_name
  end

  def tag_list
    @tag_list || tags.map(&:name).join(", ")
  end

  def assign_tags
    if @tag_list
      self.tags = @tag_list.split(/,/).uniq.map do |name|
        Tag.where(:name => name).first || Tag.create(:name => name)
      end
    end
  end
  acts_as_taggable
  def author_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

 def display_name
    @display_name ||= if audio? && metadata?
                        artist, title = metadata.values_at('artist', 'title')
                        title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : audio_file_name
                      else
                        audio_file_name
                      end
  end

  private

  def extract_metadata
    return unless audio?
    path = audio.queued_for_write[:original].path
    open_opts = { :encoding => 'utf-8' }
    Mp3Info.open(path, open_opts) do |mp3info|
      self.metadata = mp3info.tag
    end
  end
end
