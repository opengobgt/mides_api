class ComunidadSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :url, :departamento, :municipio

  def url
    departamento_municipio_comunidad_url(object.departamento_id, object.municipio_id, object.id)
  end

  def departamento
    departamento_url(object.departamento_id)
  end

  def municipio
    departamento_municipio_url(object.departamento_id, object.municipio_id)
  end

end
