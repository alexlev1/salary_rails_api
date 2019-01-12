class EmployeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :salary
end