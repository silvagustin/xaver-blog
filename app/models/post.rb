class Post < ApplicationRecord
  belongs_to :usuario, dependent: :destroy
end
