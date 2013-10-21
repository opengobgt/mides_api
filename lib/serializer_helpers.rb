module SerializerHelpers

  def include_departamento?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('departamento')
    end
  end

  def include_municipios?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('municipios')
    end
  end

  def include_municipio?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('municipio')
    end
  end

  def include_comunidades?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('comunidades')
    end
  end

  def include_comunidad?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('comunidad')
    end
  end

  def include_escuelas?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('escuelas')
    end
  end

  def include_escuela?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('escuela')
    end
  end


  def include_estudiante?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('estudiante')
    end
  end

  def departamento_url
    scope.request.protocol + \
    scope.request.host + \
    (':' + scope.request.port.to_s rescue '') + \
    departamento_path(object.departamento_id)
  end

  def municipio_url
    departamento_municipio_url(object.departamento_id, object.municipio_id)
  end

  def municipios_url
    departamento_municipios_url(object)
  end

  def comunidad_url
    departamento_municipio_comunidad_url(object.departamento_id, object.municipio_id, object.comunidad_id)
  end


  def comunidades_url
    departamento_municipio_comunidades_url(object.departamento_id, object.id)
  end

  def escuela_url
    scope.request.protocol + \
    scope.request.host + \
    (':' + scope.request.port.to_s rescue '') + \
    escuela_path(object.escuela_id)
  end

  def escuelas_url
    departamento_escuelas_url(object)
  end

  
  def estudiante_url
    scope.request.protocol + \
    scope.request.host + \
    (':' + scope.request.port.to_s rescue '') + \
    estudiante_path(object.miembro_id)
  end

  def estudiantes_url
    escuela_estudiantes_url(object.id)
  end

  

end
