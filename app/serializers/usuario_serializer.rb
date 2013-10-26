class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :departamento, :municipio, :escuelas
  
  has_one :departamento
  has_one :municipio
  has_many :escuelas

  
end
