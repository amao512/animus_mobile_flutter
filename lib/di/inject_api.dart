import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:animus_mobile_flutter/app/config/app_config.dart';
import 'package:animus_mobile_flutter/data/api/service/api_service.dart';
import 'package:animus_mobile_flutter/data/api/interceptor/interceptor_manager.dart';

injectApi() {
  getIt.registerFactory(
    () => ApiService(
      InterceptorManager.setupInterceptors(),
      baseUrl: AppConfig.baseUrl,
    ),
  );
}
