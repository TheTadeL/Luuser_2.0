import 'package:flutter/material.dart';
import 'package:luuser_fltr/data/SchoolDAO.dart';

class NewSchoolForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSchoolFormState();
  }
}

class NewSchoolFormState extends State<NewSchoolForm> {
  // Globalen Schlüssel erstellen, damit das Formular identifiziert werden kann.
  // Note: GlobalKey<FormState> NICHT GlobalKey<NewSchoolFormState>!
  final _formKey = GlobalKey<FormState>();
  final textControllers = <String, TextEditingController>{
    'name': TextEditingController(),
    'place': TextEditingController(),
    'canton': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              children: <Widget>[
                _buildTextFormField('Schulname', textControllers['name'], true),
                _buildTextFormField('Ort', textControllers['place'], true),
                _buildTextFormField('Kanton', textControllers['canton'], true),
                _buildSaveButton(),
              ],
            ),
          ),
          FloatingActionButton(
            // When the user presses the button, show an alert dialog with the
            // text the user has typed into our text field.
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has typed in using our
                    // TextEditingController
                    content: Text(textControllers['name'].text +
                        "\n" +
                        textControllers['place'].text +
                        "\n" +
                        textControllers['canton'].text),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: Icon(Icons.text_fields),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textControllers.forEach((key, value) {
      textControllers[key].dispose(); // Controller wieder leeren.
    });
    super.dispose();
  }

  // Form-Textfelder
  Container _buildTextFormField(
      String label, TextEditingController controller, bool isMandatory) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.black87),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                gapPadding: 4,
                borderSide: BorderSide(
                    color: Colors.black54,
                    width: 1.8,
                    style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                gapPadding: 4,
                borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 1.8,
                    style: BorderStyle.solid)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gapPadding: 4,
              borderSide: BorderSide(color: Colors.black54),
            )),
        validator: (value) {
          if (value.isEmpty && isMandatory) {
            return 'Dieses Feld darf nicht leer sein!';
          }
        },
      ),
    );
  }

  // Speichern-Button
  RaisedButton _buildSaveButton() {
    return RaisedButton(
      onPressed: () {
        if (this._formKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Daten werden verarbeitet')));
          SchoolDao dao = new SchoolDao();
          dao.saveSchool(
              textControllers['name'].text,
              textControllers['place'].text,
              textControllers['canton'].text
          ).whenComplete((){
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Eintrag wurde gespeichert')));
            //Todo: Umleiten auf Schulliste.
          });
        }
      },
      child: Text('Speichern'),
    );
  }
}
