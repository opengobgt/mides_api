class Municipio < ActiveRecord::Base
  self.table_name = 'PRM_MUNICIPIO'
  self.primary_key = 'MunCod'

  alias_attribute :id,              :MunCod
  alias_attribute :departamento_id, :DepCod
  alias_attribute :nombre,          :MunDes
  alias_attribute :estado,          :MunEst # a saber

end
