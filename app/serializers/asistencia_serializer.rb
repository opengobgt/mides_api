class AsistenciaSerializer < ActiveModel::Serializer
  include SerializerHelpers

  attributes :fecha, :grado, :fecha_digitacion, :ano, :estudiante_url, :escuela_url

  has_one :estudiante, serializer: EstudianteSerializer
  has_one :escuela

 
end
