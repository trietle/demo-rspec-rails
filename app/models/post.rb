class Post < ActiveRecord::Base
  attr_accessible :description, :title, :published
  validates :title, :presence => true
  #validates_presence_of :title

  def get_title
    if self.published?
      [self.title, "(P)"].join(' ')
    else
      self.title
    end
  end

  #find published post, raise RecordNotFound if it doesnt found
  def self.find_published_post(id)
    self.find(id, :conditions => { published: true} )
  end
end
