import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabie_todo/src/presentation/pages/add_task_page.dart';
import 'package:manabie_todo/src/presentation/pages/all_task_page.dart';
import 'package:manabie_todo/src/presentation/pages/complete_task_page.dart';
import 'package:manabie_todo/src/presentation/pages/incomplete_task_page.dart';
import 'package:manabie_todo/src/presentation/widgets/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pageList = [
    const AllTaskPage(),
    const CompleteTaskPage(),
    const IncompleteTaskPage()
  ];

  late int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pageList[_selectedIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTaskPage(),
            ),
          );
        },
        label: const Text('Add task'),
        icon: const Icon(Icons.add_rounded),
        backgroundColor: AppColors.primaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.fontColor,
        selectedItemColor: AppColors.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank_rounded),
            label: 'Incomplete',
          ),
        ],
      ),
    );
  }
}
