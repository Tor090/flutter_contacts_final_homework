import 'package:flutter/material.dart';
import 'contact.dart';
import 'package:favorite_button/favorite_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}


class HomePageState extends State<HomePage> {
  //bool fav = false;
  List<Contact> contacts = [Contact("assets/images/blove.jpeg","Brandi","Love","Actress","+380688300271",true),
    Contact("assets/images/clove.jpeg","Cortney","Zoe","Musician","+380677448890",false),
  Contact("assets/images/nikolaev.jpeg","Igor","Nikolaev","Musician","+380679969128",false),
    Contact("assets/images/cruz.jpeg","Monica","Cruz","Actress","+380679969187",false),
    Contact("assets/images/cobain.jpeg","Kurt","Cobain","Musician","+380679979128",true),];
  List<String> letters = [];

  Widget letter (Contact contacts,Contact contact2){
    letters.add(contacts.secondname![0]);
    if(contacts.secondname![0] == contact2.secondname![0]){
      return Divider();
    }else{
     return Padding(padding: EdgeInsets.only(left: 10),
         child: Align(alignment: Alignment.centerLeft,
           child: Text(contacts.secondname![0],
               style: TextStyle(fontSize: 16,)),
         ));
    }
  }
  Widget lett (Contact contacts){
    letters.add(contacts.secondname![0]);
      return Padding(padding: EdgeInsets.only(left: 10),
        child: Align(alignment: Alignment.centerLeft,
          child: Text(contacts.secondname![0],
            style: TextStyle(fontSize: 16,)),
        ));
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(

    body: ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index){
        contacts.sort((a,b) => a.secondname.toString().compareTo(b.secondname.toString()));

        return  Column(
          children: [
            index >0 && index<=contacts.length?
            letter(contacts[index],contacts[index-1])
            : lett(contacts[index]),
            ListTile(
              leading:  StarButton(
                iconSize: 40,
                isStarred: contacts[index].favorite,
                valueChanged: (_ifFavorite){},
               iconColor: Colors.blue,
              ),
              title:  Container(
                child: Row( children: [
                  CircleAvatar(child: Image.asset(contacts[index].icon!), radius: 40,),
                  Column(children : [
                    Text("${contacts[index].name!} ${contacts[index].secondname!}"),
                    Text(contacts[index].companyname!),
          ]),
                ]),
              ),


          ),]
        );
      },
    ),
  );
  }

}

