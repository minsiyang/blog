class Article < ApplicationRecord
# Each article can have many comments
    has_many :comments, dependent: :destroy  
    validates :title, presence: true,
                      length: { minimum: 5 }
end
