import '../../data/repositories/empleadoRepository.dart';

class InsertarEmpleado {
  final EmpleadoRepository repository;

  InsertarEmpleado(this.repository);

  void call(int id, String nombre) {
    repository.insertar(id, nombre);
  }
}