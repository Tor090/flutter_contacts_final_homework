import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masked_text/masked_text.dart';
import 'contact.dart';

class Editcontact extends StatefulWidget {
  static Contact? contact;

  //const Editcontact({Key? key}) : super(key: key);

  @override
  EditcontactState createState() => EditcontactState();
}

class EditcontactState extends State<Editcontact> {
  //Contact contact;
  //EditcontactState(this.contact);
  final _formKey = GlobalKey<FormState>();
  final _cName = TextEditingController();
  final _cSecName = TextEditingController();
  final _cCompany = TextEditingController();
  final _cPhone = TextEditingController();
  final _cBio = TextEditingController();

  @override
  void dispose() {
    _cName.dispose();
    _cSecName.dispose();
    _cCompany.dispose();
    _cPhone.dispose();
    _cBio.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _cName.text = Editcontact.contact!.name!;
    _cSecName.text = Editcontact.contact!.secondname!;
    _cCompany.text = Editcontact.contact!.companyname!;
    _cPhone.text = Editcontact.contact!.phone!;
    _cBio.text = Editcontact.contact!.bio!;
    super.initState();
  }
  Contact? newcontact;
  void updatecontact(){

  }

  @override
  Widget build(BuildContext context) {

    MaskedTextField inputPhoneNumber = new MaskedTextField(
      maskedTextFieldController: _cPhone,
      mask: "+380xxxxxxxxx",
      maxLength: 13,
      inputDecoration: InputDecoration(
        labelText: "Phone",
      ),
      keyboardType: TextInputType.phone,
    );

    Center picture = Center(
      child: Image.asset(Editcontact.contact!.icon!),
    );


    TextField inputName = TextField(
      controller: _cName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        //border: OutlineInputBorder,
        labelText: "Name",
        ),
      maxLength: 35,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87
      ),
    );

    TextField inputSecName = TextField(
      controller: _cSecName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Second name",
        ),
      maxLength: 35,
      style: TextStyle(
          fontSize: 16,
          color: Colors.black87
      ),
    );

    TextField inputCompany = TextField(
      controller: _cCompany,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Company",
        ),
      style: TextStyle(
          fontSize: 16,
          color: Colors.black87
      ),
    );

    TextField inputBio = TextField(
      controller: _cBio,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Bio",
        ),

      style: TextStyle(
          fontSize: 16,
          color: Colors.black87
      ),
      );

    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.backspace),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
      title: Text("Edit"),
          actions: <Widget>[
            Container(
        child: IconButton(
          icon: Text(
          'Save',
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
      onPressed: (){
              Editcontact.contact!.name = _cName.text;
              Editcontact.contact!.secondname = _cSecName.text;
              Editcontact.contact!.companyname = _cCompany.text;
              Editcontact.contact!.phone = _cPhone.text;
              Editcontact.contact!.bio = _cBio.text;
              _sendDataBack(context);

      },),
            ),
          ],
        ),
      body:  ListView(
        children :[ Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(3),
              child: Column(
                      children: [
                        picture,
                        SizedBox(height: 15,),
                            Row(
                              children: [
                                Expanded(child: inputName),
                                SizedBox(width: 5,),
                                Expanded(child: inputSecName),
                              ],
                            ),
                        SizedBox(height: 8,),
                        inputCompany,
                        SizedBox(height: 8,),
                        inputPhoneNumber,
                        SizedBox(height: 8,),
                        inputBio
                      ],
                    ),
          ),
        ),],
      ),
    );
  }
  void _sendDataBack(BuildContext context) {
    var newcontact = Editcontact.contact;
    Navigator.pop(context, newcontact);
  }

}
