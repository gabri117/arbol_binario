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
        SnackBar(content: Text("ID debe ser un número válido y nombre no puede estar vacío")),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Árbol de Empleados"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulario para ingresar empleados
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: "ID del Empleado"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(labelText: "Nombre del Empleado"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _insertarEmpleado,
                  child: Text("Agregar Empleado"),
                ),
                SizedBox(width: 10),
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
                  Text("Recorrido Preorden:", style: TextStyle(fontSize: 18)),
                  ...repository.preorden(repository.raiz).map((e) => Text(e)),
                  SizedBox(height: 20),
                  Text("Recorrido Inorden:", style: TextStyle(fontSize: 18)),
                  ...repository.inorden(repository.raiz).map((e) => Text(e)),
                  SizedBox(height: 20),
                  Text("Recorrido Postorden:", style: TextStyle(fontSize: 18)),
                  ...repository.postorden(repository.raiz).map((e) => Text(e)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}