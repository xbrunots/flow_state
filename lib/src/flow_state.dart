import 'package:signals_flutter/signals_flutter.dart';

import '../src/flow_viewmodel.dart';

mixin FlowState<T> {
  abstract final FlowViewModel<T> viewModel;

  get stream => flow.toStream();

  final flow = signal<T?>(null);

  T get model => flow.watch(viewModel.context) ?? viewModel.initState;

  set setValue(value) => flow.set(value, force: true);

  emit(value) => flow.set(value, force: true);

  dispose() => flow.dispose();
}
