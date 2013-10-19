class EscuelaSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :direccion, :telefono, :nivel, :jornada, :sector, :status, :url, :departamento, :municipio, :estudiantes

  def url
    escuela_url(object.id)
  end

  def departamento
    departamento_url(object.departamento_id)
  end

  def municipio
    departamento_municipio_url(object.departamento_id, object.municipio_id)
  end

  def estudiantes
    escuela_estudiantes_url(object.id)
  end
end
