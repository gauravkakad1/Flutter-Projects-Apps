import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("WhatsApp"),
              bottom: const TabBar(tabs: [
                Icon(Icons.camera_alt),
                Text("Chats"),
                Text("Status"),
                Text("Calls"),
              ]),
              actions: [
                const Icon(Icons.search),
                const SizedBox(
                  width: 10,
                ),
                PopupMenuButton(
                    icon: const Icon(Icons.more_horiz_outlined),
                    itemBuilder: (
                      context,
                    ) =>
                        const [
                          PopupMenuItem(value: '1', child: Text("New Group")),
                          PopupMenuItem(value: '2', child: Text("Setting")),
                          PopupMenuItem(value: '3', child: Text("Logout")),
                        ]),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: TabBarView(children: [
              const Text("Camera"),
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text("ABC",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("hi ....."),
                      trailing: Text("12:30 PM"),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      ),
                    );
                  }),
              ListView.builder(itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Recently Updated"),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 3)),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          ),
                        ),
                        title: const Text(
                          "ABC",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text("11 Minute ago"),
                      )
                    ],
                  );
                } else {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3)),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      ),
                    ),
                    title: const Text(
                      "ABC",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("12 Minute ago"),
                  );
                }
              }),
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text("ABC"),
                      subtitle: const Text("15 Augest 2023 , 8:30 PM",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      trailing: index % 2 == 0
                          ? const Icon(Icons.call)
                          : const Icon(Icons.videocam),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      ),
                    );
                  }),
            ])));
  }
}
