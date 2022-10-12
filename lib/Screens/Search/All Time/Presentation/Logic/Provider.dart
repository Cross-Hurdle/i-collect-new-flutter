import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/DataSource/Search_remote.datasource.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Repository/Search_repository_Impl.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Repository/TopYear_repository_impl.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/Search_repository.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/TopYear_repository.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/UseCase/GetAllTimeCollection.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/UseCase/GetAllTopCollection.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Logic/AllTimeState/Search_State.dart';

import 'AllTimeState/Search_State_Notifier.dart';
import 'TopYearState/Topyear_State.dart';
import 'TopYearState/Topyear_state_Notifier.dart';

final _datasource = Provider<SearchremoteDataSource>((ref)=>SearchremotedataSourceImpl());
final _respository = Provider<SearchRepository>((ref)=>SearchRepositoryImpl(searchremoteDataSource: ref.watch(_datasource)));
final _getAllTimeCollection = Provider<GetAllTimeCollection>((ref)=>GetAllTimeCollection(searchRepository: ref.watch(_respository)));
final getAllTimeCollectionNotifier = StateNotifierProvider<SearchStateNotifier,SearchState>((ref)=>SearchStateNotifier(getAllTimeCollection: ref.watch(_getAllTimeCollection)));



final _topyeardatasource = Provider<SearchremoteDataSource>((ref)=>SearchremotedataSourceImpl());
final _topyearrespository = Provider<SearchTopYearRepository>((ref)=>SearchTopYearRepositoryImpl(searchremoteDataSource: ref.watch( _topyeardatasource)));
final _getTopyearCollection = Provider<GetAllTopCollection>((ref)=>GetAllTopCollection(searchTopYearRepository:  ref.watch(_topyearrespository)));
final getTopyearCollectionNotifier = StateNotifierProvider< TopYearStateNotifier,TopyearState>((ref)=> TopYearStateNotifier(getAllTopCollection: ref.watch(_getTopyearCollection)));