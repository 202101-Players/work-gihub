class Genre < ApplicationRecord
  belongs_to :admin, optional: true
end
