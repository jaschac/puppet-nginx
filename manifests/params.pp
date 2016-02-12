# Defines an Nginx instance
class nginx::params
  (

    Optional[
      Hash[
        String,
        String
      ]
    ] $config = {},

    Optional[
      Hash[
        String,
        String
      ]
    ] $extra_dependencies = {}
  ){
  }
