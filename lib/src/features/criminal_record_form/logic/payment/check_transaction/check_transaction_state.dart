// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CheckTransactionState {
  final String operationId;
  CheckTransactionState({required this.operationId});
}

class InitialCheckTransactionState extends CheckTransactionState {
  InitialCheckTransactionState({required super.operationId});
}

class LoadingCheckTransactionState extends CheckTransactionState {
  LoadingCheckTransactionState({required super.operationId});
}

class LoadingOtherMethodState extends CheckTransactionState {
  LoadingOtherMethodState({required super.operationId});
}

class SuccessCheckTransactionState extends CheckTransactionState {
  SuccessCheckTransactionState({required super.operationId});
}

class ReloadCheckTransactionState extends CheckTransactionState {
  ReloadCheckTransactionState({required super.operationId});
}

class ErrorCheckTransactionState extends CheckTransactionState {
  final String errorMessage;

  ErrorCheckTransactionState({
    required this.errorMessage,
    required super.operationId,
  });
}

class LoadingSucceedTransactionState extends CheckTransactionState {
  LoadingSucceedTransactionState({required super.operationId});
}

class ErrorSucceedTransactionState extends CheckTransactionState {
  final String errorMessage;

  ErrorSucceedTransactionState({
    required this.errorMessage,
    required super.operationId,
  });
}
