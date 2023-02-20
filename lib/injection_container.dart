import 'package:get_it/get_it.dart';
import 'package:practice_application/features/sign_up/data/data_source/register_data_source.dart';
import 'package:practice_application/features/sign_up/data/repositories/register_repositories.dart';
import 'package:practice_application/features/sign_up/domain/use_cases/register_user_domain.dart';
import 'features/sign_up/domain/repositories/register_repo_domain.dart';

final GetIt s1 = GetIt.instance;

Future<void> init() async {
  /**
   * ! Features
   */
  // Bloc
  // sl.registerFactory(
  //   () => TopHeadlinesNewsBloc(
  //     getTopHeadlinesNews: sl(),
  //     searchTopHeadlinesNews: sl(),
  //   ),
  // );

  // Use Case
  s1.registerLazySingleton(
      () => RegisterUserrr(registerRepository: s1()));

  // Repository
  s1.registerLazySingleton<RegisterRepositoryDomain>(
      () => RegisterRepository(registerDataSource: s1()));

  // Data Source
  s1.registerLazySingleton<RegisterDataSource>(() => RegisterDataSourceImpl());

  /**
   * ! Core
   */
  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /**
   * ! External
   */
  //sl.registerLazySingleton(() {
  //   final dio = Dio();
  //   dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;
  //   dio.interceptors.add(DioLoggingInterceptor());
  //   return dio;
  // });
  // sl.registerLazySingleton(() => ConstantConfig());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
