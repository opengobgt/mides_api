class MunicipioSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :url, :departamento, :comunidades, :escuelas

  def url
    departamento_municipio_url(object.departamento_id, object.id)
  end

  def departamento
    departamento_url(object.departamento_id)
  end

  def comunidades
    departamento_municipio_comunidades_url(object.departamento_id, object.id)
  end

  def escuelas
    departamento_municipio_escuelas_url(object.departamento_id, object.id)
  end
end
