class ComunidadSerializer < ActiveModel::Serializer
  include SerializerHelpers

  attributes :id, :nombre, :url, :departamento_url, :municipio_url

  has_one :departamento
  has_one :municipio

  def url
    departamento_municipio_comunidad_url(object.departamento_id, object.municipio_id, object.id)
  end



end
