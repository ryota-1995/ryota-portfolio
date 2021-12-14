class Live < ApplicationRecord
  has_many :performers
  is_impressionable
end
