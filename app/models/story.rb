class Story < ActiveRecord::Base
  #correct validations to add in a way to prevent/ remind users that the maximum number of characters in a link is 100
  validates :name,  
  presence: true,
  length: {maximum: 100},
  allow_nil: false
  
  validates :link, 
  presence: true,
  length: {maximum: 100},
  allow_nil: false
  
  has_many :votes
  
  def to_param
    "#{id}-#{name.gsub(/\W/,'-').downcase}"
  end
  
end
