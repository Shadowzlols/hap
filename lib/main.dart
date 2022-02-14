import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hyperlink Text Example',

      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen()
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Link Generator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Link(
                  uri: Uri.parse('https://reddit.com/random'),
                  target: LinkTarget.self,
                  builder: (context, followLink) {
                    return RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Click here: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Reddit',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = followLink,
                        ),
                      ]),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Link(
//when taps the link, moves to second screen.
              uri: Uri.parse('/second'),
              builder: (context, followLink) {
                return InkWell(
                  onTap: followLink,
                  child: Text(
                    'Go to Second Screen',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
//popping the current screen from the stack, Shows First Screen.
            Navigator.pop(context);
          },
          child: Text('Go Back To First Screen'),
        ),
      ),
    );
  }
}