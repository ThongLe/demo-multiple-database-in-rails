class UserBalancesController < ApplicationController
  def show
    render json: { user_balance: { id: user_balance.id }  }
  end

  def add
    user_balance.with_lock do
      user_balance.balance += value
      user_balance.reason = {
        delta: value,
        note: "[add] #{value}"
      }
      user_balance.save!
    end

    render json: { add: { value: value } }
  end

  def sub
    user_balance.balance -= value
    user_balance.reason = {
      delta: -value,
      note: "[sub] #{value}"
    }
    user_balance.save!

    render json: { sub: { value: value } }
  end

  private

  def user_balance
    @user_balance ||= UserBalance.find(id)
  end

  def id
    params[:id]
  end

  def value
    params[:value].to_d
  end
end

##  Case 1
# user_balance.balance += value
# user_balance.reason = {
#   delta: value,
#   note: "[add] #{value}"
# }
# user_balance.save!
