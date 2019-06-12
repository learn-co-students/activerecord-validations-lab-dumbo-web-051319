# ActiveRecord Validations Lab

# Basic Validations
Add validations to these models such that...
#AUTHOR                                                         #in model/author.rb
1. All authors have a name                                      validates :name, presence: true
2. No two authors have the same name                            validates :name, uniqueness: true
3. Author phone numbers are 10 digits                           validates :phone_number, length: {is: 10}

#POSTS                                                          #in model/post.rb
1. All posts have a title                                       validates :name, presence: true
2. Post content is at least 250 characters long                 validates :content, length: {minimum: 250}
3. Post summary is a maximum of 250 characters                  validates :summary, length: {maximum: 250}
4. Post category is either `Fiction` or `Non-Fiction`:          validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
 This step requires an `inclusion` validator, which was not outlined  in the README lesson. You'll need to refer to  the [Rails guide][ar_validations] to look up how  to use it. [ar_validations]: http://guides.rubyonrails.org/active_record_validations.html






# Custom Validations

Finally, add a custom validator to `Post` that ensures the title is sufficiently
clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
[number]", or "Guess", the validator should return false.

For future projects, it's a good idea to skim the list of available validation options.
It will give you a sense of what's available and help with creating
validations for your own model objects.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/activerecord-validations-lab'>ActiveRecord Validations Lab</a> on Learn.co and start learning to code for free.</p>

#LEARN Checklist
Author
  is valid
  is invalid with no name 
  is invalid with a short number 
  is invalid when non-unique 

Post
  is valid
  is invalid without a title 
  is invalid with too short content 
  is invalid with a long summary 
  is invalid with a category outside the choices
  is invalid if not clickbait 

#LEARN Failures
1) Author is invalid with no name
     Failure/Error: expect(author).to be_invalid
       expected `#<Author id: nil, name: nil, phone_number: "5553054425", created_at: nil, updated_at: nil>.invalid?` to return true, got false

2) Author is invalid with a short number
     Failure/Error: expect(author).to be_invalid
       expected `#<Author id: nil, name: "Caligula", phone_number: "555305442", created_at: nil, updated_at: nil>.invalid?` to return true, got false

3) Author is invalid when non-unique
     Failure/Error: expect(author).to be_invalid
       expected `#<Author id: nil, name: "Caligula", phone_number: "5557890001", created_at: nil, updated_at: nil>.invalid?` to return true, got false

4) Post is invalid without a title
     Failure/Error: expect(missing_title).to be_invalid
       expected `#<Post id: nil, title: nil, content: "Lorem ipsum dolor sit amet, consectetur adipiscing...", summary: "Abstract.", category: "Fiction", created_at: nil, updated_at: nil>.invalid?` to return true, got false

5) Post is invalid with too short content
     Failure/Error: expect(short_content).to be_invalid
       expected `#<Post id: nil, title: "You Won't Believe These True Facts", content: "too short", summary: "Abstract.", category: "Fiction", created_at: nil, updated_at: nil>.invalid?` to return true, got false


6) Post is invalid with a long summary
     Failure/Error: expect(long_summary).to be_invalid
       expected `#<Post id: nil, title: "You Won't Believe These True Facts", content: "Lorem ipsum dolor sit amet, co...m dolor sit amet, consectetur adipiscing...", category: "Fiction", created_at: nil, updated_at: nil>.invalid?` to return true, got false

7) Post is invalid with a category outside the choices
     Failure/Error: expect(invalid_cat).to be_invalid
       expected `#<Post id: nil, title: "You Won't Believe These True Facts", content: "Lorem ipsum dolor sit amet, co...ur adipiscing...", summary: "Abstract.", category: "Bowling Ball", created_at: nil, updated_at: nil>.invalid?` to return true, got false

8) Post is invalid if not clickbait
     Failure/Error: expect(non_clickbait).to be_invalid
       expected `#<Post id: nil, title: "True Facts", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...", summary: "Abstract.", category: "Fiction", created_at: nil, updated_at: nil>.invalid?` to return true, got false

