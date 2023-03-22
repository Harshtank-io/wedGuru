import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import 'package:wed_guru/util/cards.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}


class _UserHomeState extends State<UserHome> {
  int counter = 4;
  @override
  Widget build(BuildContext context) {

    SwipeableCardSectionController _cardController =
    SwipeableCardSectionController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor:  Colors.blue,
          elevation: 0,
          title: Text("Wed Guru"),
          centerTitle: true,

          titleTextStyle: GoogleFonts.dancingScript(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.settings),),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25)
            )
          ),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.person),),],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SwipeableCardsSection(
              cardController: _cardController,
              context: context,
              //add the first 3 cards
              items: const [
                CardView(text: "Chinki "),
                CardView(text: "Natasha"),
                CardView(text: "Bruce Banner"),
              ],
              onCardSwiped: (dir, index, widget) {
                //Add the next card
                if (counter <= 50) {
                  _cardController.addItem(CardView(text: "Persons $counter"));
                  counter++;
                }

                if (dir == Direction.left) {
                  print('onDisliked ${(widget as CardView).text} $index');
                } else if (dir == Direction.right) {
                  print('onLiked ${(widget as CardView).text} $index');
                } else if (dir == Direction.up) {
                  print('onUp ${(widget as CardView).text} $index');
                } else if (dir == Direction.down) {
                  print('onDown ${(widget as CardView).text} $index');
                }
              },
              enableSwipeUp: true,
              enableSwipeDown: true,
            ),
            SizedBox(height: 30),
            Text(
              'Find You Heaven Here!',
              style:GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ) ,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.chevron_left),
                    onPressed: () => _cardController.triggerSwipeLeft(),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.chevron_right),
                    onPressed: () => _cardController.triggerSwipeRight(),
                  ),
                  // FloatingActionButton(
                  //   child: Icon(Icons.arrow_downward),
                  //   onPressed: () => _cardController.triggerSwipeDown(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

