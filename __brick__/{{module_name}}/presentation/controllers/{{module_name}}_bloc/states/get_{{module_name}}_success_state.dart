import '../../../../domain/entities/{{module_name}}.dart';
import '{{module_name}}_states.dart';

class Get{{module_name.pascalCase()}}SuccessState implements {{module_name.pascalCase()}}States {
  final {{module_name.pascalCase()}} {{module_name.camelCase()}};

  const Get{{module_name.pascalCase()}}SuccessState(this.{{module_name.camelCase()}});
}
