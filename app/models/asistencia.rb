require 'composite_primary_keys'

class Asistencia < ActiveRecord::Base
  self.table_name = 'CUMPLIMIENTO_CORRES_EDUCACION'
  self.primary_keys = :HogCod, :MieCod, :Cod_UDI, :Fecha_Llenado
  
  alias_attribute :familia_id, :HogCod
  alias_attribute :miembro_id, :Miecod
  alias_attribute :escuela_id, :Cod_UDI
  alias_attribute :grado,      :Grado
  alias_attribute :fecha,      :Fecha_Llenado
  alias_attribute :usuario_id,  :Usuario
  alias_attribute :fecha_digitacion, :Fecha_Digitacion
  alias_attribute :ano,        :Anio

  belongs_to :familia, foreign_key: "HogCod"
  belongs_to :estudiante, foreign_key: "Miecod", class_name: "Miembro"
  belongs_to :escuela, foreign_key: "Cod_UDI"
  
end

# == Schema Information
#
# Table name: CUMPLIMIENTO_CORRES_EDUCACION
#
#  HogCod           :string(15)       not null, primary key
#  Miecod           :integer          not null
#  Cod_UDI          :string(150)
#  Grado            :integer          not null
#  Fecha_Llenado    :datetime         not null
#  Usuario          :integer          not null
#  Fecha_Digitacion :datetime         not null
#  Anio             :string(10)       not null
#

