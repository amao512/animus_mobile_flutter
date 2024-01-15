import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:animus_mobile_flutter/di/inject_api.dart';
import 'package:animus_mobile_flutter/di/inject_bloc.dart';
import 'package:animus_mobile_flutter/di/inject_db.dart';
import 'package:animus_mobile_flutter/di/inject_repository.dart';
import 'package:animus_mobile_flutter/di/inject_usecases.dart';

init() async {
  injectCore();
  injectApi();
  injectRepository();
  injectDb();
  injectUseCases();
  injectBloc();
}