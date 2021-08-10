class Todo < ApplicationRecord
    include Rails.application.routes.url_helpers
    belongs_to :user
    has_one_attached :avatar
    has_one_attached :attachment
    validates :title, presence: true, length: { in: 3..100, too_long: "%{count} characters is the minimum and maximum allowed" }
    # validates :avatar, content_type: [:png, :jpg, :jpeg], size: { less_than: 3.megabytes , message: 'is not given between size' }
    # validates :attachment, content_type: { in: 'application/pdf', message: 'is not a PDF' }

    def image_url
        url_for(self.avatar)
    end
end
