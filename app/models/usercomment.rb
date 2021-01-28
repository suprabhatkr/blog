class Usercomment < ApplicationRecord
  include Visible
  belongs_to :article
end
