import 'package:easy_pro/src/datasource/models/check_transaction_request.dart';

abstract class CheckTransactionEvent {
  CheckTransactionEvent();
}

class OnChangeOperationId extends CheckTransactionEvent {
  final String operationId;
  OnChangeOperationId({required this.operationId});
}

class OnCheckStatusTransaction extends CheckTransactionEvent {
  final CheckTransactionRequest transaction;
  OnCheckStatusTransaction({
    required this.transaction,
  });
}

class OnCheckOperatorStatus extends CheckTransactionEvent {
  OnCheckOperatorStatus();
}

class OnOtherPayment extends CheckTransactionEvent {
  final String receiptUrl;
  OnOtherPayment({required this.receiptUrl});
}
