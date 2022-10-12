import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Datasource/Home_remote.dataSource.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Repository/Home_Repository_impl.dart';
import 'package:icollekt/Screens/Home/HomePage/Domain/Repository/Home_repository.dart';
import 'package:icollekt/Screens/Home/HomePage/Domain/UseCase/GetHomeData.dart';
import 'package:icollekt/Screens/Home/HomePage/Presentation/Logic/Home_state/Home_State.dart';
import 'package:icollekt/Screens/Home/HomePage/Presentation/Logic/Home_state/Home_State_Notifier.dart';

final _homedatasource = Provider<HomeRemoteDataSource>((ref)=>HomeRemoteDataSourceImpl());
final _homerespository = Provider<HomeRepository>((ref)=>HomeRepositoryImpl( homeRemoteDataSource: ref.watch( _homedatasource),));
final _getHomeCollection = Provider<GetHomeData>((ref)=>GetHomeData( homeRepository: ref.watch(_homerespository)));
final getHomeCollectionNotifier = StateNotifierProvider< HomeStateNotifieer,HomeState>((ref)=> HomeStateNotifieer( homeData: ref.watch(_getHomeCollection),));