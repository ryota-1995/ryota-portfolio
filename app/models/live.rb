class Live < ApplicationRecord
  has_many :performers
  is_impressionable counter_cache: true
end
