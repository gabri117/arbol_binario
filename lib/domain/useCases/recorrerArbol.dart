import '../../data/repositories/empleadoRepository.dart';

class RecorrerArbol {
  final EmpleadoRepository repository;

  RecorrerArbol(this.repository);

  List<String> preorden() => repository.preorden(repository.raiz);
  List<String> inorden() => repository.inorden(repository.raiz);
  List<String> postorden() => repository.postorden(repository.raiz);
}