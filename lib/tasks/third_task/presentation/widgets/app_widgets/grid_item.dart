import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/business_logic/cubits/movie_cubit.dart';
import 'package:hackathon_fatura/tasks/third_task/data/models/movie_model.dart';
import 'package:hackathon_fatura/tasks/third_task/helper/utility.dart';
import 'package:hackathon_fatura/tasks/third_task/presentation/widgets/common/custom_text.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_constants.dart';

class GridItem extends StatelessWidget {
  MovieModel movieModel;

  GridItem({
    required this.movieModel,
  });

  final List<Widget> iconsWidgets = [
    Icon(
      Icons.favorite,
      color: Colors.red,
    ),
    Icon(Icons.favorite_outline)
  ];

  @override
  Widget build(BuildContext context) {
    var movieCubit = MovieCubit.get(context);
    return Column(
      children: [
        movieModel.posterPath != ''
            ? Image(
                image: NetworkImage(
                    ThirdTaskConstants.BaseImagePath + movieModel.posterPath.toString()),
                width: double.infinity,
                height: 200,
                //fit: BoxFit.fill,
              )
            : FlutterLogo(
                size: 200,
              ),
        SizedBox(height: 5),
        Row(
          children: [
            CustomText(
              text: '${movieModel.title}',
              maxLines: 2,
              fontSize: 18,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                //HomeCubit.get(context).setFavorite(product);
                movieCubit.changeFavorite(movieModel);
              },
              icon: Utility.box.get(movieModel.id) == null
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
              iconSize: 24,
            )
          ],
        ),
      ],
    );
  }
}
