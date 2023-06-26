import '{{{failure_path}}}';

abstract class {{module_name.pascalCase()}}Failures implements Failure {
  final String message;

  const {{module_name.pascalCase()}}Failures({required this.message});
}
