import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/DataSource/Profile_remote.datasource.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Repository/ProfilePost_Repository_Impl.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Domain/Repository/ProfilePost_Repository.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Domain/UseCase/GetPostProfile.dart';

import 'Post_State/Post_State.dart';
import 'Post_State/Post_State_Notifier.dart';

final _profilePostdatasource = Provider< ProfileremoteDataSource>((ref)=> ProfileremotedataSourceImpl());
final _profilePostrespository = Provider<ProfilePostRepository>((ref)=>ProfilePostRepositoryImpl(profileremoteDataSource: ref.watch( _profilePostdatasource)));
final _getprofilepostCollection = Provider<GetPostProfile>((ref)=>GetPostProfile( profilePostRepository:  ref.watch(_profilePostrespository)));
final getProfilepostNotifier = StateNotifierProvider< ProfilePostStateNotifier,PostState>((ref)=> ProfilePostStateNotifier(getPostProfile:  ref.watch(_getprofilepostCollection)));