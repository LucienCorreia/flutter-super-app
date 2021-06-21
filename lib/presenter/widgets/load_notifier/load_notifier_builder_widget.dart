import 'package:flutter/material.dart';

import 'load_notifier_listenable.dart';
import 'load_notifier_state.dart';

class LoadNotifierBuilderWidget<T> extends StatefulWidget {
  final LoadNotifierListenable<T> valueListenable;
  final Widget Function(
    BuildContext context,
    Object error,
  ) onError;
  final Widget Function(
    BuildContext context,
  ) onLoading;
  final Widget Function(
    BuildContext context,
    T value,
  ) onDone;

  const LoadNotifierBuilderWidget({
    required this.valueListenable,
    required this.onError,
    required this.onLoading,
    required this.onDone,
    Key? key,
  }) : super(key: key);

  @override
  _LoadNotifierBuilderWidgetState<T> createState() =>
      _LoadNotifierBuilderWidgetState<T>();
}

class _LoadNotifierBuilderWidgetState<T>
    extends State<LoadNotifierBuilderWidget<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.valueListenable.value;
    widget.valueListenable.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(LoadNotifierBuilderWidget<T> oldWidget) {
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_valueChanged);
      value = widget.valueListenable.value;
      widget.valueListenable.addListener(_valueChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    setState(() {
      value = widget.valueListenable.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.valueListenable.state == LoadNotifierState.error) {
      return widget.onError(context, widget.valueListenable.error);
    }

    if (widget.valueListenable.state == LoadNotifierState.loading) {
      return widget.onLoading(context);
    }

    return widget.onDone(context, value);
  }
}
