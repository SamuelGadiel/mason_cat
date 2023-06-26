import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  List<String> pathParts = Directory.current.path.split('/');
  final libIndex = pathParts.indexOf('lib');

  if (libIndex == -1) return;

  pathParts = pathParts.sublist(libIndex + 2);

  final returnPath = List.generate(pathParts.length, (index) => '..').join('/');

  final failurePath = returnPath + '/../../../core/shared/domain/failures/failure.dart';
  context.vars['failure_path'] = failurePath;

  final requestClientPath = returnPath + '/../../../core/packages/request_client/request_client.dart';
  context.vars['request_client_path'] = requestClientPath;

  final servicesSettingsPath = returnPath + '/../../../core/shared/external/settings/services_settings.dart';
  context.vars['services_settings_path'] = servicesSettingsPath;

  final genericQueryPath = returnPath + '/../../../core/shared/infrastructure/mappers/name_method_query_mapper.dart';
  context.vars['generic_query_path'] = genericQueryPath;

  final messageParserPath = returnPath + '/../../../core/helpers/server_error_message_parser.dart';
  context.vars['message_parser_path'] = messageParserPath;
}
