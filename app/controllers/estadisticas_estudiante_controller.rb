class EstadisticasEstudianteController < ApplicationController
  respond_to :json

  def show
    @stats = []
    estudiante = Miembro.find(params[:id])
    @stats << estudiante_stats(estudiante)
    respond_to do |format|
      format.json { render json: @stats }
    end
  end
  
  def estudiante_stats estudiante

    {}.tap do |stats|
      stats[:estudiante] = estudiante
      stats[:totales] = {}
      stats[:totales][:ciclo] = {}
      stats[:totales][:escuela] = {}
      stats[:totales][:estudiante] = {}
      stats[:totales][:familia] = {}


      #############
      # Ciclo escolar
      #############

      stats[:totales][:ciclo][:ano] = Date.today.year

      inicio = Date.parse('2013-01-15')
      hoy = Date.today
      dias_habiles = inicio.business_days_until(hoy)
      stats[:totales][:ciclo][:dias_habiles] = dias_habiles

      #############
      # Estudiante
      #############

      primera_asistencia = estudiante.asistencias.first.fecha.to_date
      stats[:totales][:estudiante][:primera_asistencia] = primera_asistencia

      dias_habiles = primera_asistencia.business_days_until(hoy)
      stats[:totales][:estudiante][:dias_habiles] = dias_habiles

      dias_asistencia = estudiante.asistencias.count
      stats[:totales][:estudiante][:dias_asistencia] = dias_asistencia

      porcentaje_asistencia = ((dias_asistencia * 100.00)/dias_habiles).round(2)
      stats[:totales][:estudiante][:porcentaje_asistencia] = porcentaje_asistencia

      #############
      # Comparativo Escuela
      #############

      n = estudiante.escuela.estudiantes.count
      stats[:totales][:escuela][:estudiantes] = n

      sum_dias = 0
      estudiante.escuela.estudiantes.each do |e|
        sum_dias += e.asistencias.count
      end


      stats[:totales][:escuela][:dias_habiles] = dias_habiles

#      stats[:totales][:escuela][:primera_asistencia] = ''
      promedio_dias_asistencia = ( ((sum_dias / n) * 1.00)   rescue 0 )
      stats[:totales][:escuela][:promedio_dias_asistencia] = promedio_dias_asistencia 

      porcentaje_asistencia = ( (promedio_dias_asistencia * 100.00)/ dias_habiles ).round(2)
     stats[:totales][:escuela][:porcentaje_asistencia] = porcentaje_asistencia

    end
  end
end
