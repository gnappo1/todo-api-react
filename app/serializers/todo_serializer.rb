class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :completed, :completion_time
end
