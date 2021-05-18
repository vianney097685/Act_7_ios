import 'package:flutter/material.dart';
import 'package:arellano/route_generator.dart';

void main() => runApp(HatziryApp());

class HatziryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arellano',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //Fin de MaterialApp
  } //Fin de widget
} //Fin de clase HatziryApp

class PageOne extends StatelessWidget {
  String _params = "holi desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Primer pantalla de Hatziry'),
        backgroundColor: Colors.cyan[600],
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente pantalla",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Colors.cyan[400],
            onPressed: () {
              _openSecondPage(context);
            },
          ), //Fin de boton
        ), //Fin de contenedor
      ), //Fin de body center
    ); //Fin de Scaffold
  } //Fin de widget

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;

    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "TEXTO REGRESADO: $_datoRetornadoDeSecondPage",
        ),
      ),
    ); //fin de scaffold
  } //Fin de void _openSecondPage
} //Fin de clase PageOne
