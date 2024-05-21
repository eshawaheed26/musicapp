import 'package:flutter/material.dart';
import 'package:mymusicapp/settings_screen.dart';

class MyDrawer extends StatelessWidget {
   const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [ 

          DrawerHeader(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Icon(Icons.my_library_music, size: 50, color: Color.fromARGB(255, 152, 95, 163)),
         Text('♫⋆｡♪₊♬',
          style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.inversePrimary, fontFamily: 'Schyler'), 
        ),
         Text('MeloVibe',
          style: TextStyle(fontSize: 36, color: Theme.of(context).colorScheme.inversePrimary, fontFamily: 'Schyler'), 
        ),
      ],
    ),
  ),
),

          Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: ListTile(
            title: Text("H O M E", style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            leading: Icon(Icons.home,  color: Theme.of(context).colorScheme.secondary,),
            onTap: () => Navigator.pop(context),
          ),
          ),

          Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: ListTile(
            title: Text("S E T T I N G S", style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.secondary,),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen(),));
            },
          ),
          )

      ],),
    );
  }
}
