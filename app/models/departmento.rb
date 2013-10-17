class Departamento < ActiveRecord::Base
  self.table_name = 'PRM_DEPARTAMENTO'
  self.primary_key = 'DepCod'

  alias_attribute :id, :DepCod
  alias_attribute :codigo, :RegCod
  alias_attribute :nombre, :DepDes
  alias_attribute :estado, :DepEst # a saber

end
