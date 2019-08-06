class Post < ActiveRecord::Base

  # All posts have a title
  # Post content is at least 250 characters long
  # Post summary is a maximum of 250 characters
validates :title, presence: true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: { in:%w(Fiction Non-Fiction) }
validate :is_clickbait?
# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
# validates :in_stock,
# :inclusion => { in: [true, false] }

  def is_clickbait?
    my_title = ["Won't Believe","Secret","Guess"]
    # CLICKBAIT_PATTERNS = [     /Won't Believe/i,     /Secret/i,     /Top [0-9]*/i,     /Guess/i   ] 
    my_title.each do |phrase|
      # binding.pry
       if  self.title && self.title.include?(phrase)

         return true
       else
        errors.add(:title, "must be clickbait")
       end
    end
  end
end
