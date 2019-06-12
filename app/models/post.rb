 class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate  :clickbait

    #NO FUNCIONA // DOES NOT WORK
    def clickbait
      clickbait_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbait_words.each do |word|
        unless self.title.include?(word)
          self.errors.add(:title, "Not clickbait-y enough")
        end
      end
    end


end
