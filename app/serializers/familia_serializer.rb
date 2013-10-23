class FamiliaSerializer < ActiveModel::Serializer
  include SerializerHelpers

  attributes :id, :titular, :direccion, :url, :departamento_url, :municipio_url, :comunidad_url, :miembros_url

  has_many :miembros, serializer: EstudianteSerializer

 
  def url
    familia_url(object)
  end

  def miembros_url
    familia_miembros_url(object)
  end

  def comunidad_url
    departamento_municipio_comunidad_url(object.departamento_id, object.municipio_id, object.comunidad_id)
  end  
  
end
