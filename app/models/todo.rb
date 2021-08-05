class Todo < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { in: 3..100, too_long: "%{count} characters is the minimum and maximum allowed" }
end
