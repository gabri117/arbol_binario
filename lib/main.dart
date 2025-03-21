import 'package:flutter/material.dart';

void main() {
  //runApp(MyApp());
  
}

class Empleado {
  int id;
  String nombre;

  Empleado(this.id, this.nombre);
}

class Nodo {
  Empleado empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  Nodo(this.empleado);
}

class ArbolBinario {
  Nodo? raiz;

  ArbolBinario(int id, String nombre) {
    Empleado nuevoEmpleado = Empleado(id, nombre);
    Nodo nuevoNodo = Nodo(nuevoEmpleado);

    if (raiz == null) {
      raiz = nuevoNodo;
    } else {
      _insertarNodo(raiz, nuevoNodo);
    }

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

  void preorden(Nodo? nodo) {
    if (nodo == null) return;

    print("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
    preorden(nodo.izquierdo);
    preorden(nodo.derecho);
  }

  void inorden(Nodo? nodo) {
    if (nodo == null) return;

    inorden(nodo.izquierdo);
    print("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
    inorden(nodo.derecho);
  }

  void postorden(Nodo? nodo) {
    if (nodo == null) return;

    postorden(nodo.izquierdo);
    postorden(nodo.derecho);
    print("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}");
  }
}
