import 'package:dartz/dartz.dart';

import '../entities/{{module_name}}.dart';
{{#has_parameters}}import '../entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}
import '../repositories/{{module_name}}_repository.dart';

abstract class Get{{module_name.pascalCase()}} {
  Future<Either<Failure, {{module_name.pascalCase()}}>> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}});
}

class Get{{module_name.pascalCase()}}Implementation implements Get{{module_name.pascalCase()}} {
  final {{module_name.pascalCase()}}Repository repository;

  Get{{module_name.pascalCase()}}Implementation(this.repository);

  @override
  Future<Either<Failure, {{module_name.pascalCase()}}>> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}}) async {
    return repository({{#has_parameters}}parameters{{/has_parameters}});
  }
}
