import '../entities/{{module_name}}.dart';
{{#has_parameters}}import '../entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}

abstract class {{module_name.pascalCase()}}Repository {
  Future<Either<Failure, {{module_name.pascalCase()}}>> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}});
}
