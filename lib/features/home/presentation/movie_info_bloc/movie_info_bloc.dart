// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/domain/entities/movie.dart';
import '../../../../core/common/domain/usecases/movie_usecase.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';

//! Bước 4: Tích hợp BLoC
//? Trước tiên, hãy xác định các events (sự kiện) và states (trạng thái) mà BLoC của bạn sẽ xử lý.
//? Ví dụ, nếu bạn đang xây dựng một ứng dụng hiển thị danh sách phim,
//? bạn có thể có một số states như MoviesLoading, MoviesLoaded, và MoviesError.

//! Bước 4.3: Xử lý logic trong Bloc
//? Sau khi đã có các events và states, bạn cần tạo một BLoC để xử lý logic
class MovieInfoBloc extends Bloc<MoviesEvent, MoviesState> {
  GetMovies getMovies;
  MovieInfoBloc(
    this.getMovies,
  ) : super(MoviesInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(
      LoadMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final nowPlayingMovies = await getMovies.getNowPlayingMovies();
      final upCommingMovies = await getMovies.getUpcommingMovie();
      emit(MoviesLoaded(
        nowPlayingMovies ?? [],
        upCommingMovies ?? [],
      ));
    } catch (error) {
      emit(MoviesError(error.toString()));
    }
  }
}
