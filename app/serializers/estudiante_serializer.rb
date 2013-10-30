class EstudianteSerializer < ActiveModel::Serializer
  attributes :id, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento, :genero, :beneficio, :url, :escuela, :familia, :asistencias, :escuela_id, :familia_id, :grado, :estadisticas_url

  def genero
    object.genero == 1 ? 'M' : 'F'
  end

  def url
    estudiante_url(object.id)
  end

  def escuela
    escuela_url(object.escuela_id)
  end

  def familia
    estudiante_familia_url(object.id)
  end

  def asistencias
    estudiante_asistencias_url(object.id)
  end

  def estadisticas_url
    estadisticas_estudiante_url(object.id)
  end

end
