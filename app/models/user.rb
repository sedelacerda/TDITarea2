class User < ApplicationRecord
  validates :usuario, :nombre, :presence => true

end
