class Municipio < ActiveRecord::Base
  self.table_name = 'PRM_MUNICIPIO'
  self.primary_key = 'MunCod'

  alias_attribute :id,              :MunCod
  alias_attribute :departamento_id, :DepCod
  alias_attribute :nombre,          :MunDes
  alias_attribute :estado,          :MunEst # a saber

  belongs_to :departamento, foreign_key: "DepCod"
  has_many :comunidades, foreign_key: "MunCod"
  has_many :escuelas, foreign_key: "MUNCODMIN"

end

# == Schema Information
#
# Table name: PRM_MUNICIPIO
#
#  DepCod :integer          not null
#  MunCod :integer          not null, primary key
#  MunDes :string(50)       not null
#  MunEst :string(1)        not null
#

