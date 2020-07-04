class Comment < ApplicationRecord
# Each comment belongs to one article
  belongs_to :article
end
