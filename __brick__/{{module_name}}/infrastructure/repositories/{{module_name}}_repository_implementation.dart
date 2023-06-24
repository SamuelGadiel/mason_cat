import 'package:dartz/dartz.dart';

import '../../domain/entities/{{module_name}}.dart';
{{#has_parameters}}import '../../domain/entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}
import '../../domain/failures/{{module_name}}_failure.dart';
import '../../domain/repositories/{{module_name}}_repository.dart';
import '../datasources/{{module_name}}_datasource.dart';
import '../errors/{{module_name}}_error.dart';

class {{module_name.pascalCase()}}RepositoryImplementation implements {{module_name.pascalCase()}}Repository {
  final {{module_name.pascalCase()}}Datasource datasource;

  {{module_name.pascalCase()}}RepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, {{module_name.pascalCase()}}>> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}}) async {
    try {
      return Right(await datasource({{#has_parameters}}parameters{{/has_parameters}}));
    } on {{module_name.pascalCase()}}Error catch (e) {
      return Left({{module_name.pascalCase()}}Failure(message: e.message));
    } on Exception catch (e) {
      return Left({{module_name.pascalCase()}}Failure(message: e.toString()));
    }
  }
}
