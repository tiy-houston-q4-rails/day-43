class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :key, :name
end
