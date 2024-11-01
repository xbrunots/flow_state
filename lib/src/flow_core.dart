import 'package:flow_state/src/extensions/flow_extensions.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FlowCore<T> {
  final BuildContext context;

  static FlowCore newInstance(BuildContext context) =>
      SingletonExtensionWithParams.getInstance(() => FlowCore(context));

  FlowCore(this.context);

  Stream<T?> get stream => flow.toStream();

  final flow = signal<T?>(null);

  T? get value => flow.watch(context);

  set setValue(value) => flow.set(value, force: true);

  emit(value) => flow.set(value, force: true);

  dispose() => flow.dispose();
}
