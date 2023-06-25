import '{{module_name}}_events.dart';
{{#has_parameters}}import '../../../../domain/entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}

class Get{{module_name.pascalCase()}}Event implements {{module_name.pascalCase()}}Events {
  {{#has_parameters}}final {{> parameters }} parameters;{{/has_parameters}}

  const Get{{module_name.pascalCase()}}Event({{#has_parameters}}this.parameters{{/has_parameters}});
}
