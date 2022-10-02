# frozen_string_literal: true

class UserBalance < ApplicationRecord
  before_validation :set_default_values
  after_commit :create_version

  belongs_to :owner, foreign_key: :user_id, class_name: 'User'

  has_many :user_balance_versions, dependent: :destroy

  validate :reason_must_be_consistent, on: :update

  attr_accessor :reason

  private

  def set_default_values
    self.balance = 0 if balance.blank?
  end

  def set_default_reason_values
    self.reason = {
      delta: 0.to_d,
      note: 'Init balance'
    }
  end

  def create_version
    user_balance_versions.create(
      data: attributes,
      balance: balance,
      reason: reason
    )
    self.reason = {}
  end

  def reason_must_be_consistent
    errors.add(:reason, 'attr delta must be a bigdecimal') unless reason[:delta].is_a?(BigDecimal)

    errors.add(:reason, 'attr note must be a string') unless reason[:note].is_a?(String)
  end
end
