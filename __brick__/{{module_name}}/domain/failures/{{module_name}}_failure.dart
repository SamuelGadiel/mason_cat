import '{{module_name}}_failures.dart';

class {{module_name.pascalCase()}}Failure implements {{module_name.pascalCase()}}Failures {
  final String message;

  const {{module_name.pascalCase()}}Failure({required this.message});
}
