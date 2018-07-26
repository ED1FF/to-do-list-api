class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :done
end
