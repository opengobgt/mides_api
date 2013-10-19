class FamiliaSerializer < ActiveModel::Serializer
  attributes :id, :titular, :direccion, :url, :departamento, :municipio, :comunidad, :miembros
  
  
  
end
