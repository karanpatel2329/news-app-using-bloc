
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data%20layer/respository/newsRepo.dart';

import '../data layer/model/arctileModel.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsState(articleList: []));
  
  Future FetchNews ()async => emit(NewsState(articleList: await NewsRepo().getNews()));
}
