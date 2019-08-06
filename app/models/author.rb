class Author < ActiveRecord::Base
# No two authors have the same name
# Author phone numbers are exactly ten digits
# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
validates :name, presence: true
validates :name, uniqueness: true
validates :phone_number, length: { is: 10 }

end
