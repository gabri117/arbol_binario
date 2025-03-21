import 'package:flutter/material.dart';
import '../../data/repositories/empleadoRepository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmpleadoRepository repository = EmpleadoRepository(); // Única instancia
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  void _insertarEmpleado() {
    final int id = int.tryParse(idController.text) ?? 0;
    final String nombre = nombreController.text;

    if (id > 0 && nombre.isNotEmpty) {
      setState(() {
        repository.insertar(id, nombre);
        idController.clear();
        nombreController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "ID debe ser un número válido y nombre no puede estar vacío")),
      );
    }
  }

  void _limpiarArbol() {
    setState(() {
      repository.raiz = null; // Reinicia el árbol
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // Tema oscuro por defecto
        scaffoldBackgroundColor: Colors.grey[900], // Fondo del Scaffold
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850], // Fondo del AppBar
          elevation: 10, // Sombra del AppBar
          centerTitle: true, // Centrar el título
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Borde de los inputs
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue[300] ?? Colors.blue), // Borde enfocado
          ),
          labelStyle: TextStyle(color: Colors.grey[400]), // Color del label
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 25, 6, 190), // Color de los botones
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Color del texto general
          titleMedium: TextStyle(color: Colors.grey[400]),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Árbol Binario de Empleados"),
          leading: Icon(Icons.people_alt), // Ícono relacionado con empleados
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Formulario para ingresar empleados
              TextFormField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: "ID del Empleado",
                  prefixIcon: Icon(Icons.numbers, color: Colors.grey[400]),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre del Empleado",
                  prefixIcon: Icon(Icons.person, color: Colors.grey[400]),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _insertarEmpleado,
                    child: Text("Agregar Empleado"),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarArbol,
                    child: Text("Limpiar Árbol"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Mostrar recorridos
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: Colors.grey[800],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recorrido Preorden:",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ...repository.preorden(repository.raiz).map((e) => Text(e)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      color: Colors.grey[800],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recorrido Inorden:",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ...repository.inorden(repository.raiz).map((e) => Text(e)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      color: Colors.grey[800],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recorrido Postorden:",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ...repository.postorden(repository.raiz).map((e) => Text(e)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}