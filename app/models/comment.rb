class Comment < ApplicationRecord
  include Visible

  # NOTE: Should consider using 'polymorphic'
  # https://guides.rubyonrails.org/association_basics.html#polymorphic-associations
  belongs_to :article
  belongs_to :product
end
