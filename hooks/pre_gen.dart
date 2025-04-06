import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  List<String> pathParts = Directory.current.path.split('/');
  final libIndex = pathParts.indexOf('lib');

  if (libIndex == -1 || pathParts.length < libIndex + 3) {
    context.logger.warn('The structure of the lib directory is different than expected; hooks skipped.');
    return;
  }

  pathParts = pathParts.sublist(libIndex + 2);

  final returnPath = List.generate(pathParts.length, (index) => '..').join('/');

  context.vars['failure_path'] =
      '$returnPath/../../../core/shared/domain/failures/failure.dart';

  context.vars['request_client_path'] =
      '$returnPath/../../../core/packages/request_client/request_client.dart';

  context.vars['services_settings_path'] =
      '$returnPath/../../../core/shared/external/settings/services_settings.dart';

  context.vars['generic_query_path'] =
      '$returnPath/../../../core/shared/infrastructure/mappers/name_method_query_mapper.dart';

  context.vars['message_parser_path'] =
      '$returnPath/../../../core/helpers/server_error_message_parser.dart';
}
