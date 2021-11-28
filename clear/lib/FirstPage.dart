import 'package:flutter/material.dart';
import 'icoud.dart';
import 'signup.dart';
import 'customlist.dart';

/// This is the stateless widget that the main application instantiates.
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        LayoutBuilder(
          builder: (_, __) {
            return GestureDetector(
                onPanUpdate: (details) {
                  // Swiping in right direction.
                  if (details.delta.dx > 0) {
                    controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }

                  // Swiping in left direction.
                  if (details.delta.dx < 0) {
                    controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }
                },
                onTap: () {
                  controller.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text("Welcome to Clear"),
                    // Text("Tap or Swipe to begin")

                    Center(
                        child: RichText(
                      textScaleFactor: 3,
                      text: TextSpan(
                        text: 'Welcome to ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Clear',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.all(8),
                    ),
                    Center(
                        child: RichText(
                      textScaleFactor: 2,
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Tap or Swipe ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'to begin',
                          )
                        ],
                      ),
                    )),
                  ],
                ));
          },
        ),

        //second page

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text("Welcome to Clear"),
              // Text("Tap or Swipe to begin")

              Center(
                  child: RichText(
                textScaleFactor: 2,
                text: TextSpan(
                  text: 'Clear sort items by ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Priority',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.all(8),
              ),
              Center(
                  child: Text(
                "Important Items are highlighted",
                textScaleFactor: 2,
              )),

              Center(
                  child: Text(
                "at the top ....",
                textScaleFactor: 2,
              )),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(1)))),
              Image.asset("asset/image1.jpg")
            ]),

        //third page

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: RichText(
                textScaleFactor: 2,
                text: TextSpan(
                  text: ' ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Tap and hold ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'to pick an item up ',
                    )
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.all(8),
              ),
              Center(
                  child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 2,
                text: TextSpan(
                  text: "Drag it up and down to change its priority",
                  style: DefaultTextStyle.of(context).style,
                ),
              )),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(2)))),
              Image.asset("asset/image2.jpg")
            ]),

        //fourth page

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: RichText(
                      textScaleFactor: 2,
                      text: TextSpan(
                        text: ' There are three navigation levels',
                        style: DefaultTextStyle.of(context).style,
                      ))),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(3)))),
              Image.asset("asset/image3.jpg")
            ]),

        //fifth page

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 2,
                text: TextSpan(
                  text: ' ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Pitch together vertically ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'collapse your current level and navigate up ',
                    )
                  ],
                ),
              )),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(4)))),
              Image.asset("asset/image4.jpg")
            ]),

//sixth page

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 2,
                text: TextSpan(
                  text: ' ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Tap on a screen  ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'to see its content ',
                    ),
                    TextSpan(
                        text: 'Tap on a list title  ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'to edit it ',
                    ),
                  ],
                ),
              )),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(5)))),
              Image.asset("asset/image5.jpg")
            ]),

//page seven
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icloud(),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(6)))),
            ]),

//page eight

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpPage(),
              Container(
                  width: 200,
                  height: 90,
                  child: Center(
                      child: LayoutBuilder(
                          builder: (_, __) => _buildPageIndicator(7)))),
            ]),

//List page
        CustomList(),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Color(0XFF6BC4C9) : Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int selectedindex) {
    List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(i == selectedindex ? _indicator(true) : _indicator(false));
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      list[0],
      list[1],
      list[2],
      list[3],
      list[4],
      list[5],
      list[6],
      list[7]
    ]);
  }
}
