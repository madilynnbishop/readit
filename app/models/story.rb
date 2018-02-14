class Story < ActiveRecord::Base
  #correct validations to add in a way to prevent/ remind users that the maximum number of characters in a link is 100
  belongs_to :user
  
  validates :name,  
  presence: true,
  length: {maximum: 100},
  allow_nil: false
  
  validates :link, 
  presence: true,
  length: {maximum: 100},
  allow_nil: false
  
  has_many :votes do
    def latest
      order('id DESC').limit(3)
    end
  
  end
  
  def to_param
    "#{id}-#{name.gsub(/\W/,'-').downcase}"
  end
  
end
