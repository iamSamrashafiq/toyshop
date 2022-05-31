import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final Function onRatingUpdate;
  final double initialCount;
  final double itemSize;
  const RatingBarWidget({Key key,this.onRatingUpdate,@required this.initialCount,@required this.itemSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        initialRating: initialCount,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: itemSize,
        ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.orange,),
            half: const Icon(
              Icons.star_half,
              color: Colors.orange,
            ),
            empty: const Icon(
              Icons.star_outline,
              color: Colors.orange,
            )),
        onRatingUpdate: onRatingUpdate,
    );
  }
}
