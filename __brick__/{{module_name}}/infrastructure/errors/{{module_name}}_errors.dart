abstract class {{module_name.pascalCase()}}Errors implements Exception {
  final String message;

  const {{module_name.pascalCase()}}Errors(this.message);
}
