class Miembro < ActiveRecord::Base
  self.table_name = 'REG_MIEMBROS'
  self.primary_key = 'MieCod'

  alias_attribute :id, :MieCod
  alias_attribute :familia_id, :HogCod
  alias_attribute :primer_nombre, :MieNom1
  alias_attribute :segundo_nombre, :MieNom2
  alias_attribute :primer_apellido, :MieApe1
  alias_attribute :segundo_apellido, :MieApe2
  alias_attribute :fecha_nacimiento, :MieFecNac
  alias_attribute :genero, :MieSex
  alias_attribute :beneficio, :Beneficio


  belongs_to :familia, foreign_key: "HogCod"
  has_many :asistencias, foreign_key: "MieCod"

  def escuela
    asistencias.order(:Fecha_Llenado).last.escuela
  end

  def escuela_id
    escuela.id
  end


end

# == Schema Information
#
# Table name: REG_MIEMBROS
#
#  HogCod    :string(15)       not null
#  MieCod    :integer          not null, primary key
#  MieNom1   :string(20)       not null
#  MieNom2   :string(20)
#  MieApe1   :string(20)       not null
#  MieApe2   :string(20)
#  MieFecNac :datetime
#  MieSex    :integer
#  Beneficio :string(1)
#

