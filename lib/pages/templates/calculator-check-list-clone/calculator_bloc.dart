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
  final StreamController<List<Operation>> _operations$ = StreamController.broadcast();
  final StreamController<double> _total$ = StreamController<double>();

  OperationsBloc() {
    _operations$.stream.listen(_computeTotal);
  }

  Stream<List<Operation>> operations() {
    return _operations$.stream;
  }

  Stream<double> total() {
    return _total$.stream;
  }

  addOperation(Operation op) {
    _operations.add(op);
    _operations$.sink.add(_operations);
  }

  deleteOperation(Operation op) {
    _operations = _operations.where((o) => o.id != op.id).toList();
    _operations$.sink.add(_operations);
  }

  dispose() {
    _operations$.close();
    _total$.close();
    _operations = [];
  }

  _computeTotal(List<Operation> operations) {
    _total$.sink.add(operations.fold(0, (value, op2) => value + op2.value));
  }
}

final operationsBloc = OperationsBloc();
