import '{{module_name}}_states.dart';

class Get{{module_name.pascalCase()}}FailureState implements {{module_name.pascalCase()}}States {
  final String message;

  const Get{{module_name.pascalCase()}}FailureState(this.message);
}
