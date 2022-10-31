import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slidebar_with_listview/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

enum Action { share, delete, archive }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = allUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Slidable"),
        centerTitle: true,
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Slidable(
                key: Key(user.name),
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () => _onDismissed(index, Action.share),
                  ),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.green,
                      icon: Icons.share,
                      label: 'share',
                      onPressed: (context) => _onDismissed(index, Action.share),
                    ),
                    SlidableAction(
                      backgroundColor: Colors.blue,
                      icon: Icons.archive,
                      label: 'Arşivle',
                      onPressed: (context) =>
                          _onDismissed(index, Action.archive),
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  dismissible: DismissiblePane(
                    onDismissed: () => _onDismissed(index, Action.delete),
                  ),
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          _onDismissed(index, Action.delete),
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: 'Sil',
                    ),
                  ],
                ),
                child: buildUserListTile(user),
              );
            }),
      ),
    );
  }

  void _onDismissed(int index, Action action) {
    final user = users[index];
    setState(() => users.removeAt(index));
    switch (action) {
      case Action.delete:
        _showSnackbar(context, '${user.name} Silindi', Colors.red);
        break;
      case Action.archive:
        _showSnackbar(context, '${user.name} Arşivlendi', Colors.green);
        break;
      case Action.share:
        _showSnackbar(context, '${user.name} Paylaşıldı', Colors.blue);
        break;
    }
  }

  Widget buildUserListTile(User user) => Builder(
        builder: (context) => ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.image),
          ),
          onTap: () {
            final slidable = Slidable.of(context)!;
            final isClosed =
                slidable.actionPaneType.value == ActionPaneType.none;
            if (isClosed) {
              slidable.openStartActionPane();
            } else {
              slidable.close();
            }
          },
        ),
      );

  void _showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
