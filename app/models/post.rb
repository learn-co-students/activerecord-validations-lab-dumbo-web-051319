class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid size" }
  # validates :category, acceptance: { accepts: "Fiction" || "Non-Fiction"}

  validate :must_be_clickbaity

  def must_be_clickbaity
    if !/Won't Believe|Secret|Top\s*\d+|Guess/i.match(title)
      errors.add(:title, "must be clickbait")
    end
  end
end
