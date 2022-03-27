class Sakusya < ApplicationRecord
    has_many :mains
    belongs_to :user, optional: true
end
