mides_api
=========

API Publica para el Ministerio de Desarrollo de la Republica de Guatemala

## Formato

Todos los recursos responden por medio de [json](http://www.json.org/)

## Descripción de Acciones

### Autenticacion

Por default toda llamada al api sera anónima, queda limitado el uso de recursos de escritura por medio de un token. 

```
POST http://api.mides.gob.gt/educacion/asistencia?token=78BD902959639814C2844E461ECE7
```

### Namespacing

En un root element `/` se provee acceso a los catalogos base.

*Base*

```
GET http://api.mides.gob.gt/departamentos
GET http://api.mides.gob.gt/municipios
GET http://api.mides.gob.gt/comunidades
```

Se proveen dos namespaces para separar las operaciones sobre recursos relacionados a `educacion` y `salud`.

*Salud*
```
GET http://api.mides.gob.gt/salud/
```

*Educación*
```
GET http://api.mides.gob.gt/educacion/
```

### Educacion

#### Escuelas

Listado de escuelas
```
GET http://api.mides.gob.gt/educacion/escuelas
```

Listado de escuelas por departamento
```
GET http://api.mides.gob.gt/educacion/escuelas/guatemala
GET http://api.mides.gob.gt/educacion/escuelas/el-progreso
```

Listado de escuelas por municipio
```
GET http://api.mides.gob.gt/educacion/escuelas/guatemala/mixco
GET http://api.mides.gob.gt/educacion/escuelas/peten/flores
```

Listado de escuelas por comunidad
```
GET http://api.mides.gob.gt/educacion/escuelas/guatemala/mixco/san-cristobal
GET http://api.mides.gob.gt/educacion/escuelas/peten/flores/la-piedrita
```

Obtener una sola escuela
```
GET http://api.mides.gob.gt/educacion/escuelas/13-14-0724-43
GET http://api.mides.gob.gt/educacion/escuelas/27033
```

Recurso Escuela
```json
{ 
  id:           27033,
  udi:          "13-14-0724-43",
  nombre:       "EOUM-'ARMIN RAMOS MENDEZ'",
  departamento: "Huehuetenango",
  municipio:    "San Rafael de la Independencia",
  direccion:    "Aldea Pucpala"
  nivel:        "Primaria",
  jornada:      "Matutina",
  sector:       "Oficial",
  estado:       "Abierta"
}
```

#### Alumnos

Recursos relacionados a una escuela o a un catedratico ( usuario )

Listado de alumnos por escuela
```
GET http://api.mides.gob.gt/educacion/escuelas/13-14-0724-43/alumnos
GET http://api.mides.gob.gt/educacion/escuelas/27033/alumnos
```

Alumno
```
GET http://api.mides.gob.gt/educacion/alumnos/22110792
```

Nucleo familiar de alumno
```
GET http://api.mides.gob.gt/educacion/alumnos/22110792/familia
```

#### Familias

Familia
```
GET http://api.mides.gob.gt/educacion/familias/22101938
```

Familias por escuela
```
GET http://api.mides.gob.gt/educacion/escuelas/13-14-0724-43/familias
```

Familias por departamento
```
GET http://api.mides.gob.gt/educacion/familias/guatemala
```

Familias por municipio
```
GET http://api.mides.gob.gt/educacion/familias/guatemala/mixco
```

Familias por comunidad
```
GET http://api.mides.gob.gt/educacion/familias/guatemala/mixco/san-cristobal
```

### Ingreso de cumplimiento de corresponsabilidad

El recurso esta protegido por un token de aplicación

Registrar una asistencia
```
POST http://api.mides.gob.gt/educacion/corresponsabilidad
```
_Parametros_

`alumno_id`  codigo unico del alumno

`usuario_id` codigo de usuario que inicio sesion

`escuela_id` codigo de la escuela

`grado`      grado que cursa actualmente el alumno

