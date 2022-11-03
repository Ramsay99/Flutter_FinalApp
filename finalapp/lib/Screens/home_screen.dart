// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:finalapp/Screens/screens_barrel.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _content = [
    _Deliveries(),
    EmployeesScreen(),
    DashboardScreen(),
    HistoryScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _showBottomNav(),
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _content), //_content.elementAt(_index),
        ),
      ),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}

Column _Deliveries() {
  return Column(
    children: [
      CardFb2(
        text: "New Delivery",
        imageUrl: "https://static.thenounproject.com/png/621382-200.png",
        subtitle: Icon(Icons.add_box_outlined),
        onPressed: () {
          debugPrint("Pressed on Create Emp");
        },
      ),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return CardFb2(
              text: "Delivery_Num: $index",
              imageUrl:
                  "https://p1.itc.cn/q_70/images03/20210215/b5788fa341a54bf388bf4257600496cb.gif",
              subtitle: Icon(Icons.run_circle_outlined),
              onPressed: () {
                debugPrint("Pressed on $index");
              },
            );
          },
        ),
      ),
    ],
  );
}

class CardFb2 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Icon subtitle;
  final Function() onPressed;
  final double height = 75;

  CardFb2(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      double height = 75,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: height,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Row(
          children: [
            Image.network(imageUrl, height: 59, fit: BoxFit.cover),
            const SizedBox(
              width: 15,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Spacer(),
            subtitle,
            // Text(
            //   subtitle,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //       color: Colors.grey,
            //       fontWeight: FontWeight.normal,
            //       fontSize: 12),
            // ),
          ],
        ),
      ),
    );
  }
}
