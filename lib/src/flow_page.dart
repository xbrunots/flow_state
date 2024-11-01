import 'package:flutter/material.dart';

import 'flow_core.dart';

mixin FlowPage<T extends StatefulWidget> on State<T> {
  FlowCore get flowCore => FlowCore.newInstance(context);

  get stream => flowCore.stream;

  get flow => flowCore.flow;

  get model => flowCore.value;

  set emit(value) => flowCore.emit(value);

  @override
  dispose() => flowCore.dispose();
}
