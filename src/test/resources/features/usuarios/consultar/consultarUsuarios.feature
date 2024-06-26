# El "#languaje" No es un comentario representa el tipo de lenguaje utilizado en la estructura de Gherkin
#language: en

# @Todos            # Etiqueta para todos los escenarios
# @{Funcionalidad}  # Palabra clave representativa de la funcionalidad

@Todos
@ConsultarUsuarios

Feature: Consultar usuarios
Yo como usuario administrador de la plataforma ReqRes
Quiero poder ejecutar los servicios de busqueda de usuarios de la plataforma
Para la identificacion y validar el uso de las funcionalidades de la plataforma

# @HP               # Etiqueta para el Tipo de prueba [Happy Path]
# @SP               # Etiqueta para el Tipo de prueba [Sad Path]
# @AP               # Etiqueta para el Tipo de prueba [Altern Path]

Background: Acceder al servicio principal
  Given Que Genny se encuentra en la plataforma de gestion de usuarios


@HP
@ConsultarListaUsuarios
@CP-001
Scenario: Consultar lista de usuarios registrados

  When  Realiza la busqueda de la lista de usuarios
  Then Se respondera exitosamente con los resultados esperados

@HP
@ConsultarUsuario
@CP-002
Scenario Outline: Consultar un usuario registrado especifico

   When  Realiza la busqueda del usuario con <id>
   Then Se respondera exitosamente con los resultados esperados
   And Se presentara la informacion del usuario correspondiente
  Examples:
    | id |
    | 2  |
    | 4  |
    | 6  |


@SP
@UsuarioNoExiste
@CP-003
Scenario Outline: Consultar un usuario no registrado

When  Realiza la busqueda del usuario con <id>
Then Se respondera exitosamente indicando que el usuario no fue encontrado

    Examples:
      | id |
      | 25  |