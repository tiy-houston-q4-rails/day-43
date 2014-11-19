require 'securerandom'

class User < ActiveRecord::Base

  validates :username, presence: true
  validates :auth_token, presence: true

  before_validation on: :create do
    self.auth_token = SecureRandom.hex
  end
end
