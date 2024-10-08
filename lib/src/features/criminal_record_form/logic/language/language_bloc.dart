import 'package:easy_pro/src/features/criminal_record_form/logic/language/laguage_state.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_event.dart';
import 'package:easy_pro/src/shared/services/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_pro/src/datasource/models/language.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SecureStorage secureStorage;
  LanguageBloc({required this.secureStorage}) : super(const LanguageState()) {
    on<ChangeLanguage>((event, emit) async {
      await onChangeLanguage(event, emit);
    });
    on<GetLanguage>(((event, emit) async {
      await onGetLanguage(event, emit);
    }));
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    await secureStorage.saveLanguage(event.selectedLanguage.value.languageCode);

    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final selectedLanguage = await secureStorage.getLanguageValue();
    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.french,
    ));
  }
}
