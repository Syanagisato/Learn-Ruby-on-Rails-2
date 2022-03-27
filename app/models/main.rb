class Main < ApplicationRecord
    validates :user_id, {presence: true}
    belongs_to :title
    belongs_to :sakusya
    belongs_to :publisher
    belongs_to :user, optional: true
    def user
        return Main.find_by(id: self.id)
    end
end
