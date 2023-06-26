import '{{{message_parser_path}}}';
import '{{{request_client_path}}}';
import '{{{services_settings_path}}}';
import '{{{generic_query_path}}}';
import '../../domain/entities/{{module_name}}.dart';
{{#has_parameters}}import '../../domain/entities/{{> parameters.snakeCase() }}.dart';{{/has_parameters}}
import '../../infrastructure/datasources/{{module_name}}_datasource.dart';
import '../../infrastructure/errors/{{module_name}}_error.dart';
import '../../infrastructure/mappers/{{module_name}}_mapper.dart';
{{#has_parameters}}import '../../infrastructure/mappers/{{> parameters.snakeCase() }}_mapper.dart';{{/has_parameters}}

class {{module_name.pascalCase()}}DatasourceImplementation implements {{module_name.pascalCase()}}Datasource {
  final RequestClient client;

  {{module_name.pascalCase()}}DatasourceImplementation(this.client);

  @override
  Future<{{module_name.pascalCase()}}> call({{#has_parameters}}{{> parameters }} parameters{{/has_parameters}}) async {
    final response = await client.post(
      ServicesSettings.endpoint,
      {{#has_parameters}}body: {{> parameters }}Mapper.toJson(parameters),{{/has_parameters}}
      {{^has_parameters}}body: {},{{/has_parameters}}
      queryParameters: NameMethodQueryMapper.toJson(name: ' ', method: ' '),
    );

    if (response.statusCode != 200) {
      final message = ServerErrorMessageParser.getMessage(data: response.data, messageCallback: 'Não foi possivel obter os dados.');

      throw {{module_name.pascalCase()}}Error(message);
    }

    return {{module_name.pascalCase()}}Mapper.fromJson(response.data);
  }
}
