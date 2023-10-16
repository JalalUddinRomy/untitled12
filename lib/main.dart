import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }

}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }

}
class _HomescreenState extends State<HomeScreen>{
  int count=0;
  List<bool> selected = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
          return ListTile(

            title: Text('Item ${index+1}'),
            tileColor: selected[index] ? Colors.blue : null,
            onTap: (){
              count++;
              setState(() {
                selected[index] = !selected[index];
              });
            },

          );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context){
         return AlertDialog(
           title: Text("Selected Items"),
           content: Text("Number of Selected Items $count"),
           actions: [
             TextButton(onPressed: (){
               Navigator.pop(context);
             }, child: Text("Close"))
           ],
         );
        });
      },child: Icon(Icons.add),),
    );
  }

}