import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/global.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _WhatsappState();
}

class _WhatsappState extends State<homepage> {
  Future<Null> showPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => SizedBox(
          height: 500,
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    backgroundColor: Colors.white70,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        date = val;
                      });
                    }),
              ),
              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));
  }

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  DateTime date = DateTime.now();
  PageController pageController = PageController();
  TabController? tabController;
  bool isIOS = false;
  dynamic bottomItemIndex;

  @override
  Widget build(BuildContext context) {
    return (isIOS)
        ? CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            "WhatsApp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          backgroundColor: CupertinoColors.systemGreen,
          trailing: CupertinoSwitch(
              activeColor: CupertinoColors.white,
              thumbColor: CupertinoColors.systemGreen,
              value: isIOS,
              onChanged: (val) {
                setState(() {
                  isIOS = val;
                });
              }),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            inactiveColor: Colors.black,
            activeColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.arrowtriangle_right_square,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person_alt_circle_fill,
                ),
              ),
            ],
          ),
          tabBuilder: (context, i) {
            return IndexedStack(
              index: i,
              children: [
                ListView.builder(
                  itemCount: Global.allContact.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: Text(
                        Global.allContact[i]['title'],
                      ),
                      subtitle: Text(
                        Global.allContact[i]['subtitle'],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: Global.allContact.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: Text(
                        Global.allContact[i]['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: MaterialButton(
                      color: Colors.greenAccent,
                      onPressed: () => _showDatePicker(context),
                      child: const Text(
                        "Data Picker",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    )
        : MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "WhatsApp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              Switch(
                  value: isIOS,
                  onChanged: (val) {
                    setState(() {
                      isIOS = val;
                    });
                  }),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Call",
                ),
              ],
            ),
            backgroundColor: Colors.green,
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (i) {
              setState(() {
                tabController!.animateTo(i);
              });
            },
            children: [
              TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount:16,
                    itemBuilder: (context, i) => Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(
                          Global.allContact[i]['title'],
                        ),
                        subtitle: Text(
                          Global.allContact[i]['subtitle'],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: Global.allContact.length,
                    itemBuilder: (context, i) => Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(
                          Global.allContact[i]['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () => _showDatePicker(context),
                        child: const Text(
                          "Data Picker",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
