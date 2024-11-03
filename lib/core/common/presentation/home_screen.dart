// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/core/common/presentation/blocs/global_info_bloc/global_info_bloc.dart';
import 'package:flutter_learning/core/common/presentation/widgets/header_section.dart';
import 'package:flutter_learning/core/common/presentation/widgets/movie_item.dart';
import 'package:flutter_learning/core/common/presentation/widgets/upcoming_section.dart';
import 'package:flutter_learning/core/services/injection_container.dart';
import 'package:flutter_learning/core/utils/convert_util.dart';
import '../../../features/home/presentation/movie_info_bloc/movie_info_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieInfoBloc>(
      create: (context) => MovieInfoBloc(getIt()
          // GetMovies(
          //   MovieRepositoryImpl(
          //       remoteDataSource:
          //           MovieRemoteDataSourceImpl(dio: DioClient().dio)),
          // ),
          )
        ..add(LoadMovies()),
      child: Scaffold(
        body: Column(
          children: [
            HeaderSection(
              onPressed: () async {
                // await GoogleSignIn()
                //     .signOut(); // Đảm bảo rằng đăng xuất Google trước tiên
                // await FirebaseAuth.instance.signOut();

                Navigator.of(context).pushNamed('profile');
              },
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<MovieInfoBloc, MoviesState>(
                      builder: (context, state) {
                        if (state is MoviesLoaded) {
                          final upcommingMovies = state.upcommingMovies;
                          return BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
                              builder: (_, state) {
                            final imageConfigInfo = state.imageConfigInfo;
                            if (imageConfigInfo != null) {
                              final listPosterImage = upcommingMovies
                                  .map((e) =>
                                      imageConfigInfo.baseUrl +
                                      imageConfigInfo
                                          .getPosterSizeText('w342') +
                                      e.posterPath)
                                  .toList();
                              return UpcomingSection(
                                listUpcommingMoviesPoster: listPosterImage,
                                setStateFunc: (index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Center(
                  //     child: AnimatedSmoothIndicator(
                  //       activeIndex: currentIndex,
                  //       count: listUpcommingMoviesPoster.length,
                  //       effect: const ExpandingDotsEffect(
                  //           activeDotColor: Color(0xffFF8036),
                  //           expansionFactor: 2.5,
                  //           spacing: 6,
                  //           dotHeight: 8,
                  //           dotColor: Color(0xff637394),
                  //           dotWidth: 8),
                  //     ),
                  //   ),
                  // ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Now in cinemas",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.search,
                            color: Color(0xff637394),
                            size: 28,
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    sliver: BlocBuilder<MovieInfoBloc, MoviesState>(
                        builder: (context, state) {
                      if (state is MoviesLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is MoviesLoaded) {
                        final movies = state.nowPlayingMovies;

                        return BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
                          builder: (context, state) {
                            final imageConfigInfo = state.imageConfigInfo;
                            if (imageConfigInfo != null) {
                              final imageConfigInfo = state.imageConfigInfo;

                              return SliverGrid.builder(
                                  itemCount: movies.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 163 / 320,
                                  ),
                                  itemBuilder: (_, index) {
                                    final filteredGenreList =
                                        convertGenreIdsToGenreStrings(
                                            movies[index].genreIds,
                                            state.genreList!);
                                    final selectedGenreTexts = filteredGenreList
                                        .map((e) => e.name)
                                        .toList();
                                    return MovieItem(
                                      posterImgPath: imageConfigInfo!.baseUrl +
                                          imageConfigInfo
                                              .getPosterSizeText("w342") +
                                          movies[index].posterPath,
                                      title: movies[index].title,
                                      genre: selectedGenreTexts.join(", "),
                                      score: movies[index].voteAverage,
                                    );
                                  });
                            }
                            return const SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        );
                      }

                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
