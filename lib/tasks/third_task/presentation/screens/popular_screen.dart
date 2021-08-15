import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_fatura/tasks/third_task/business_logic/cubits/movie_cubit.dart';
import 'package:hackathon_fatura/tasks/third_task/presentation/widgets/app_widgets/grid_item.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_constants.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movieCubit = MovieCubit.get(context);
    movieCubit.getMovies(MoviesSortBy.popularity);
    return SingleChildScrollView(
      child: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
        return Container(
          color: Colors.grey[200],
          child: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
            if (movieCubit.moviePage == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 3,
                padding: EdgeInsets.all(8),
                childAspectRatio: 1 / 1.51,
                children: List.generate(movieCubit.moviePage!.movies!.length, (index) {
                  return GridItem(
                    movieModel: movieCubit.moviePage!.movies![index],
                  );
                }),
              );
            }
          })
        );
      }),
    );
  }
}
