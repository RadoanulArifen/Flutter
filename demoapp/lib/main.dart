import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber ),
      darkTheme: ThemeData(primarySwatch:Colors.deepPurple),
      color: Colors.green,
      debugShowCheckedModeBanner: false,
      home:HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
      
    );

  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Inverntory"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity:1 ,
        elevation: 20,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed:(){MySnackBar("Comment press Successful",context);} , icon:Icon(Icons.comment) ,)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: (){MySnackBar("Document add successfully",context);},
        backgroundColor: Colors.green,
        

      ),
      body:Text("Hello Flutter") ,

    );
  }

}