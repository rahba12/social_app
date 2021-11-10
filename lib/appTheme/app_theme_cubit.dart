import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appThemeStates.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(ChangeAppTheme());

  static AppThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppTheme() {
    isDark = !isDark;
    emit(ChangeAppTheme());
  }
}
