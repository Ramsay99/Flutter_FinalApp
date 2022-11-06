import 'package:finalapp/Widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({super.key});

  @override
  State<CustomerFeedback> createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 200, 200, 200),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("How can we improve your experience with the company? "),
        ),
        TextField(),
        SizedBox(
          height: 30,
        ),
        DefaultButton(
          label: "Submit",
          onTap: () {},
        )
      ]),
    ));
  }
}

// import 'package:graphx/graphx.dart';
// import 'scene/rating_scene.dart';

// class RatingStarsMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('rating stars')),
//       body: SceneBuilderWidget(
//         builder: () => SceneController(back: RatingStarsScene()),
//         autoSize: true,
//       ),
//     );
//   }
// }

// import 'star.dart';

// const Color kBgColor = Color(0xFFEBEDFD);
// const Color kStarColor = Color(0xFFFCC915);
// const Color kUnselectedSColor = Color(0xFF7F86AC);

// class RatingStarsScene extends GSprite {
//   double get sw => stage!.stageWidth;

//   double get sh => stage!.stageHeight;
//   late List<Star> stars;
//   late GSprite container;

//   @override
//   void addedToStage() {
//     stage!.color = kBgColor;
//     container = GSprite();
//     addChild(container);
//     stars = List.generate(
//       5,
//       (index) {
//         var star = Star();
//         container.addChild(star);
//         star.setPosition(index * (star.starSize + 5), 0);
//         star.onMouseOver.add((_) {
//           hoverStar(index);
//         });
//         star.onMouseClick.add((_) {
//           selectStar(index);
//         });
//         return star;
//       },
//     );
//     container.alignPivot();
//     final bb = container.bounds!;
//     container.graphics.beginFill(kColorTransparent).drawGRect(bb).endFill();
//     container.onMouseOut.add((event) {
//       if (container.hitTouch(GPoint(
//         container.mouseX,
//         container.mouseY,
//       ))) return;
//       for (var i = 0; i < stars.length; i++) {
//         stars[i].hoverState(false);
//       }
//     });
//     stage!.onResized.add(() {
//       container.setPosition(sw / 2, sh / 2);
//     });
//   }

//   void selectStar(int index) {
//     for (var i = 0; i < stars.length; i++) {
//       if (i <= index) {
//         stars[i].selectState(true);
//       } else {
//         stars[i].selectState(false);
//       }
//     }
//   }

//   void hoverStar(int index) {
//     for (var i = 0; i < stars.length; i++) {
//       if (i <= index) {
//         stars[i].hoverState(true);
//       } else {
//         stars[i].hoverState(false);
//       }
//     }
//   }
// }

