import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
            actions: <Widget>[
             IconButton(
               icon: Icon(Icons.contacts)
             )
            ],
          title: Text("Inicio"),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _apellido = "";
  String _edad = "";
  String _correo = "";

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Nombre'
            ),
            validator: (name) {
              if (name.isEmpty) {
                return 'Por favor escriba su nombre';
              }
              _name = name;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Apellidos'
            ),
            validator: (apellido) {
              if (apellido.isEmpty) {
                return 'Por favor escriba su Apellido';
              }
              _apellido = apellido;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Correo'
            ),
            validator: (correo) {
              if (correo.isEmpty) {
                return 'Por favor escriba su correo';
              }
              _correo = correo;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Edad'
            ),
            validator: (edad) {
              if (edad.isEmpty) {
                return 'Por favor escriba su edad';
              }
              _edad = edad;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> DataScreen(_name,_apellido,_edad,_correo),));
                }
              },
              child: Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}

class DataScreen extends StatefulWidget {
  final String name ;
  final String apellido ;
  final String edad ;
  final String correo ;

  DataScreen(this.name,this.apellido,this.edad,this.correo);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.data_usage)
            )
          ],
          title: Text("Datos"),
        ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
            Text("Nombre: "+widget.name),
              Text(""),
              Text("Apellido: " + widget.apellido),
              Text(""),
              Text("Correo: "+widget.correo),
              Text(""),
              Text("Edad: "+ widget.edad),

            ],
          ),
      ),
    );
  }
}
