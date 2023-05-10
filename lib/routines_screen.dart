import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({Key? key}) : super(key: key);

  @override
  _RoutinesScreenState createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  List<String> routines = [
    'Routine 1',
    'Routine 2',
    'Routine 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            // TODO: Implement edit button behavior
          },
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () {
              // TODO: Implement add button behavior
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: Key(routines[index]),
            endActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const BehindMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      routines.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Routine deleted'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              title: Text(routines[index]),
              onTap: () {
                // TODO: Navigate to routine-specific page
              },
            ),
          );
        },
      ),
    );
  }
}
