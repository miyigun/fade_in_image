import 'package:flutter/material.dart';

List<String> imageList = [
  "https://images.pexels.com/photos/13108133/pexels-photo-13108133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/9368035/pexels-photo-9368035.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/13146110/pexels-photo-13146110.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fade In Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int imageIndex = 0;

  void NextImage() {
    if (imageIndex < 2) {
      setState(() {
        imageIndex++;
      });
    }
  }

  void PreviousImage() {
    if (imageIndex > 0) {
      setState(() {
        imageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 250,
                height: 250,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/loading.gif",
                  image: imageList[imageIndex],
                  fadeInDuration: Duration(seconds: 2),
                  fadeInCurve: Curves.easeIn,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => PreviousImage(),
                    child: Text("Previous Image")),
                ElevatedButton(
                    onPressed: () => NextImage(), child: Text("Next Image")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
