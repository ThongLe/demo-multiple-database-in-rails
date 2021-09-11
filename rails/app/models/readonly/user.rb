# frozen_string_literal: true

module Readonly
  class User < Readonly::ApplicationRecord
    self.table_name = 'users'
  end
end
