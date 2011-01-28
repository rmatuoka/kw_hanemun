class Quote < ActiveRecord::Base
  belongs_to :package
  has_one :cart
  has_one :transaction
end
