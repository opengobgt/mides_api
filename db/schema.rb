# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "CUMPLIMIENTO_CORRES_EDUCACION", id: false, force: true do |t|
    t.string   "HogCod",           limit: 15,                           null: false
    t.decimal  "Miecod",                       precision: 12, scale: 0, null: false
    t.string   "Cod_UDI",          limit: 150
    t.integer  "Grado",                                                 null: false
    t.datetime "Fecha_Llenado",                                         null: false
    t.integer  "Usuario",                                               null: false
    t.datetime "Fecha_Digitacion",                                      null: false
    t.string   "Anio",             limit: 10,                           null: false
  end

  create_table "ESCUELA", id: false, force: true do |t|
    t.integer "DEPCODMIN"
    t.string  "Nombre del Departamento", limit: 150
    t.integer "MUNCODMIN"
    t.string  "Nombre del Municipio",    limit: 150
    t.string  "Esc_UDI",                 limit: 150, null: false
    t.string  "Esc_Nombre",              limit: 150
    t.string  "Esc_Direccion",           limit: 150
    t.string  "Teléfono",                limit: 150
    t.string  "Nivel Educativo",         limit: 150
    t.string  "Jornada escolar",         limit: 150
    t.string  "Sector",                  limit: 150
    t.string  "Status",                  limit: 150
  end

  create_table "PRM_DEPARTAMENTO", id: false, force: true do |t|
    t.integer "DepCod",            null: false
    t.integer "RegCod",            null: false
    t.string  "DepDes", limit: 50, null: false
    t.string  "DepEst", limit: 1,  null: false
  end

  create_table "PRM_LUGARPOBLADO", id: false, force: true do |t|
    t.integer "DepCod",               null: false
    t.integer "MunCod",               null: false
    t.integer "LugPobCod",            null: false
    t.string  "LugPobDes", limit: 50, null: false
    t.string  "LugPobEst", limit: 1,  null: false
  end

  create_table "PRM_MUNICIPIO", id: false, force: true do |t|
    t.integer "DepCod",            null: false
    t.integer "MunCod",            null: false
    t.string  "MunDes", limit: 50, null: false
    t.string  "MunEst", limit: 1,  null: false
  end

  create_table "REG_FAMILIA", id: false, force: true do |t|
    t.string  "HogCod",    limit: 15,                          null: false
    t.integer "DepCod",                                        null: false
    t.integer "MunCod",                                        null: false
    t.integer "LugPobCod",                                     null: false
    t.text    "HogDir"
    t.decimal "HogTitCod",            precision: 12, scale: 0
  end

  create_table "REG_MIEMBROS", id: false, force: true do |t|
    t.string   "HogCod",    limit: 15,                          null: false
    t.decimal  "MieCod",               precision: 12, scale: 0, null: false
    t.string   "MieNom1",   limit: 20,                          null: false
    t.string   "MieNom2",   limit: 20
    t.string   "MieApe1",   limit: 20,                          null: false
    t.string   "MieApe2",   limit: 20
    t.datetime "MieFecNac"
    t.integer  "MieSex",    limit: 2
    t.string   "Beneficio", limit: 1
  end

  create_table "USUARIO", primary_key: "UsuCod", force: true do |t|
    t.string  "UsuID",       limit: 12,  null: false
    t.string  "UsuNom",      limit: 100, null: false
    t.string  "UsuPas",      limit: 20,  null: false
    t.integer "DepCod"
    t.integer "MunCod"
    t.boolean "Estado"
    t.integer "Usu_creador"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

end
