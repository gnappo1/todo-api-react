class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :completed, :completion_time, :user, :avatar_format, :attachment_format

  def avatar_format
    return unless object.avatar.attached?
    object.avatar.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: object.image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def attachment_format
    return unless object.attachment.attached?

    object.attachment.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: object.image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end
end
