class Todo < ApplicationRecord
    validates :title, presence: true, length: { in: 3..100, too_long: "%{count} characters is the minimum and maximum allowed" }
end
