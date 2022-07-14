import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "WELLCOME TO AAiT STACK OVERFLOW",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Image(
                image: AssetImage("assets/images/1.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Image(
                image: AssetImage("assets/images/2.jpg"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Image(image: AssetImage("images/3.png")),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/questions/add');
        },
        label: const Text('Ask Question'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
