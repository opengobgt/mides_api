class MunicipioSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :departamento, :comunidades

  def departamento
    departamento_url(object.departamento_id)
  end

  def comunidades
    departamento_municipio_comunidades_url(object.departamento_id, object.id)
  end
end
