import '../../domain/entities/{{module_name}}.dart';
{{#has_parameters}}import '../../domain/entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}

abstract class {{module_name.pascalCase()}}Datasource {
  Future<{{module_name.pascalCase()}}> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}});
}