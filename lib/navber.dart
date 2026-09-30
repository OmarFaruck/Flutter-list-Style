import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class navber extends StatelessWidget {
   navber({super.key});

final List<Map<String,dynamic>>users=[

   {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'asad',
     'phone':'01858927228',
   },
    {
     'name':'rina',
     'phone':'01858927228',
   },


   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(users[index]['name']),
              subtitle: Text(users[index]['phone']),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person),
              ),
            ),
          );
        },

      ),
    );
  }
}
