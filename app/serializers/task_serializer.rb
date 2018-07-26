class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :done
end
