import 'dart:async';

import 'package:flutter/foundation.dart';

class Operation {
  final double value;
  final String description;
  final String id;

  Operation({
    @required this.id,
    @required this.value,
    @required this.description,
  });
}

class OperationsBloc {
  List<Operation> _operations = [];

  final StreamController<List<Operation>> _operations$ = StreamController<List<Operation>>();

  Stream<List<Operation>> operations() {
    return _operations$.stream;
  }

  addOperation(Operation op) {
    _operations.add(op);
    _operations$.sink.add(_operations);
  }

  deleteOperation(Operation op) {
    _operations = _operations.where((o) => o.id != op.id);
    _operations$.sink.add(_operations);
  }

  dispose() {
    _operations$.close();
    _operations = [];
  }
}

final operationsBloc = OperationsBloc();
