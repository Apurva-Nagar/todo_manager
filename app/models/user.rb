class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "#{id}. | #{name} | #{email}"
  end
end
