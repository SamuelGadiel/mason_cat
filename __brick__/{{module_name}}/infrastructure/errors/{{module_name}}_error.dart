import '{{module_name}}_errors.dart';

class {{module_name.pascalCase()}}Error implements {{module_name.pascalCase()}}Errors {
  @override
  final String message;

  const {{module_name.pascalCase()}}Error(this.message);
}
