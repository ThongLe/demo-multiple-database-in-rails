# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_balances, foreign_key: :user_id, dependent: :destroy
end
