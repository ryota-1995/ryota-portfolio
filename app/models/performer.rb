class Performer < ApplicationRecord
  belongs_to :live, foreign_key: "live_id"
end
