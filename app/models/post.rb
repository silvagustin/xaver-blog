class Post < ApplicationRecord
  belongs_to :usuario, dependent: :destroy

  def anterior
    self.class.where("id < ?", id).last
  end

  def siguiente
    self.class.where("id > ?", id).first
  end
end
