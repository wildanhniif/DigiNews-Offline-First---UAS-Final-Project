import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import '../network/api_client.dart';
import '../database/isar_service.dart';
import '../../features/news/data/datasources/news_remote_datasource.dart';
import '../../features/news/data/datasources/news_local_datasource.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/domain/usecases/get_news.dart';
import '../../features/news/presentation/bloc/news_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Core
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton<Isar>(() => IsarService.isar);

  // Data Sources
  locator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(locator()),
  );

  // Repositories
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // UseCases
  locator.registerLazySingleton<GetNews>(() => GetNews(locator()));

  // Blocs
  locator.registerFactory<NewsBloc>(() => NewsBloc(getNews: locator()));
}
