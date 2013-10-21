class DepartamentoSerializer < ActiveModel::Serializer
  include SerializerHelpers

  delegate :params, to: :scope

  attributes :id, :nombre, :url, :municipios_url, :escuelas_url

  has_many :municipios
  has_many :escuelas

  def url
   scope.request.protocol + \
    scope.request.host + \
    (':' + scope.request.port.to_s rescue '') + \
    departamento_path(object)
  end

end
