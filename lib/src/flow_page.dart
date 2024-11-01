import 'package:flutter/material.dart';

import 'flow_core.dart';

mixin FlowPage<T extends StatefulWidget> on State<T> {
  FlowCore get _flowCore => FlowCore.newInstance(context);

  get stream => _flowCore.stream;

  get flow => _flowCore.flow;

  get model => _flowCore.value;

  set setValue(value) => _flowCore.emit(value);

  emit(value) => _flowCore.emit(value);

  @override
  dispose() => _flowCore.dispose();
}
