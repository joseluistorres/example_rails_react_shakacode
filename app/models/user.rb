class User < ApplicationRecord
  belongs_to :company
  has_many :machine_data
end
