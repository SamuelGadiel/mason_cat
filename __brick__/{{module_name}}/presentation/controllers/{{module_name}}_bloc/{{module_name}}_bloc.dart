import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/get_{{module_name}}.dart';
import '../stores/{{module_name}}_store.dart';
import 'events/get_{{module_name}}_event.dart';
import 'events/{{module_name}}_events.dart';
import 'states/get_{{module_name}}_failure_state.dart';
import 'states/get_{{module_name}}_loading_state.dart';
import 'states/get_{{module_name}}_success_state.dart';
import 'states/{{module_name}}_initial_state.dart';
import 'states/{{module_name}}_states.dart';

class {{module_name.pascalCase()}}Bloc extends Bloc<{{module_name.pascalCase()}}Events, {{module_name.pascalCase()}}States> implements Disposable {
  final Get{{module_name.pascalCase()}} usecase;
  final {{module_name.pascalCase()}}Store store;

  {{module_name.pascalCase()}}Bloc(this.usecase, this.store) : super(const {{module_name.pascalCase()}}InitialState()) {
    on<Get{{module_name.pascalCase()}}Event>(_mapGet{{module_name.pascalCase()}}EventToState);
  }

  @override
  Future<void> dispose() async => close();

  FutureOr<void> _mapGet{{module_name.pascalCase()}}EventToState(Get{{module_name.pascalCase()}}Event event, Emitter<{{module_name.pascalCase()}}States> emit) async {
    emit(const Get{{module_name.pascalCase()}}LoadingState());

    final result = await usecase({{#has_parameters}}event.parameters{{/has_parameters}});

    result.fold(
      (l) => emit(Get{{module_name.pascalCase()}}FailureState(l.message)),
      (r) {
        store.{{module_name.camelCase()}} = r;
        emit(Get{{module_name.pascalCase()}}SuccessState(r));
      },
    );
  }
}
