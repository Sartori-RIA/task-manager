# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :argon2,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true
end
