import 'package:flutter/material.dart';
import 'package:navigationdrawer/data.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  double sizeWidth = 250;

  late int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Navigation Drawer',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.menu,
            size: 22,
            color: Colors.black,
          ),
        ),
      ),
      //body: dataDrawer.list[page].widget,
      body: Center(
        child: Text(
          dataDrawer.list[page].name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      width: sizeWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: sizeWidth,
              height: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 20,
                      )),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                      'assets/luffy.jpg',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Monkey D. Luffy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: Colors.grey,
                height: 0.5,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataDrawer.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      dataDrawer.list[index].icon,
                      color: Colors.black,
                      size: 22,
                    ),
                    tileColor:
                        page == index ? Colors.blueAccent : Colors.transparent,
                    title: Text(
                      dataDrawer.list[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        page = index;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
