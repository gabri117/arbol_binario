import '../models/empleadoModel.dart';

class Nodo {
  EmpleadoModel empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  Nodo(this.empleado);
}

class EmpleadoRepository {
  Nodo? raiz;

  void insertar(int id, String nombre) {
    EmpleadoModel nuevoEmpleado = EmpleadoModel(id, nombre);
    Nodo nuevoNodo = Nodo(nuevoEmpleado);

    if (raiz == null) {
      raiz = nuevoNodo;
    } else {
      _insertarNodo(raiz, nuevoNodo);
    }
  }

  void _insertarNodo(Nodo? nodo, Nodo nuevoNodo) {
    if (nodo == null) return;

    if (nuevoNodo.empleado.id < nodo.empleado.id) {
      if (nodo.izquierdo == null) {
        nodo.izquierdo = nuevoNodo;
      } else {
        _insertarNodo(nodo.izquierdo, nuevoNodo);
      }
    } else {
      if (nodo.derecho == null) {
        nodo.derecho = nuevoNodo;
      } else {
        _insertarNodo(nodo.derecho, nuevoNodo);
      }
    }
  }

  List<String> preorden(Nodo? nodo) {
    List<String> resultado = [];
    _preorden(nodo, resultado);
    return resultado;
  }

  void _preorden(Nodo? nodo, List<String> resultado) {
    if (nodo == null) return;

    resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
    _preorden(nodo.izquierdo, resultado);
    _preorden(nodo.derecho, resultado);
  }

  List<String> inorden(Nodo? nodo) {
    List<String> resultado = [];
    _inorden(nodo, resultado);
    return resultado;
  }

  void _inorden(Nodo? nodo, List<String> resultado) {
    if (nodo == null) return;

    _inorden(nodo.izquierdo, resultado);
    resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
    _inorden(nodo.derecho, resultado);
  }

  List<String> postorden(Nodo? nodo) {
    List<String> resultado = [];
    _postorden(nodo, resultado);
    return resultado;
  }

  void _postorden(Nodo? nodo, List<String> resultado) {
    if (nodo == null) return;

    _postorden(nodo.izquierdo, resultado);
    _postorden(nodo.derecho, resultado);
    resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
  }
}