import 'package:flutter/material.dart';

import 'flow_state.dart';

abstract class FlowViewModel<T> {
  final BuildContext context;
  final FlowState state;

  const FlowViewModel(this.context, this.state);

  abstract final T initState;
}
