import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_pro/src/datasource/repositories/criminal_record_repository.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_bloc.dart';
import 'package:easy_pro/src/shared/dio/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => CriminalBloc(
          criminalRecordRepository: locator<CriminalRecordRepository>(),
        ),
        child: this,
      ),
      BlocProvider(
        create: (_) => PaymentBloc(
          criminalRecordRepository: locator<CriminalRecordRepository>(),
        ),
        child: this,
      ),
      BlocProvider(
        create: (_) => CheckTransactionBloc(
          criminalRecordRepository: locator<CriminalRecordRepository>(),
        ),
        child: this,
      ),
    ], child: const AutoRouter());
  }
}
