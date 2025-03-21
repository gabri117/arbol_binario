import 'package:flutter/material.dart';
import '../../domain/useCases/recorrerArbol.dart';
import '../../data/repositories/empleadoRepository.dart';

class HomePage extends StatelessWidget {
  final EmpleadoRepository repository = EmpleadoRepository();
  final RecorrerArbol recorrerArbol;

  HomePage() : recorrerArbol = RecorrerArbol(EmpleadoRepository()) {
    // Insertar datos de prueba
    repository.insertar(5, "Director General");
    repository.insertar(3, "Gerente de Ventas");
    repository.insertar(7, "Gerente de Operaciones");
    repository.insertar(2, "Supervisor de Ventas");
    repository.insertar(4, "Supervisor de Marketing");
    repository.insertar(6, "Supervisor de Logística");
    repository.insertar(8, "Supervisor de IT");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Árbol de Empleados"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Recorrido Preorden:", style: TextStyle(fontSize: 18)),
          ...recorrerArbol.preorden().map((e) => Text(e)),
          SizedBox(height: 20),
          Text("Recorrido Inorden:", style: TextStyle(fontSize: 18)),
          ...recorrerArbol.inorden().map((e) => Text(e)),
          SizedBox(height: 20),
          Text("Recorrido Postorden:", style: TextStyle(fontSize: 18)),
          ...recorrerArbol.postorden().map((e) => Text(e)),
        ],
      ),
    );
  }
}