class User < ApplicationRecord
  validates :first_name, presence: true, uniqueness: { case_sensitive: true }, length: {maximum: 50}
end
