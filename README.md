Árbol Binario de Empleados
Este programa en Dart permite construir un árbol binario de empleados y realizar los recorridos preorden, inorden y postorden para visualizar la jerarquía de la empresa en diferentes órdenes.

📖 Descripción
El programa simula la estructura jerárquica de una empresa utilizando un árbol binario. Cada nodo del árbol representa un empleado con su ID y nombre. El árbol permite:

Insertar empleados.

Realizar recorridos preorden, inorden y postorden.

Limpiar el árbol para reiniciar la estructura.

🛠 Requisitos
Dart SDK: Asegúrate de tener Dart instalado en tu sistema.

Editor de código: Recomendamos usar Visual Studio Code con la extensión de Dart (Flutter).

🚀 Cómo Usar
Clona el repositorio:

bash

git clone https://github.com/tu-usuario/arbol_binario.git
cd arbol_-binario_binario__
Ejecuta el programa:

Si estás usando un IDE como Visual Studio Code, simplemente abre la carpeta del proyecto y ejecuta el archivo main.dart.
Asegúrate de tener enlazado un emulador Android para hacer funcionar la app.

Si prefieres la terminal, ejecuta:

bash

dart run lib/main.dart

Interactúa con el programa:

Ingresa el ID y el nombre del empleado en los campos de texto.

Presiona "Agregar Empleado" para insertar el empleado en el árbol.

Presiona "Limpiar Árbol" para reiniciar la estructura.

Los recorridos preorden, inorden y postorden se mostrarán automáticamente.

🧩 Estructura del Proyecto
El proyecto está organizado de la siguiente manera:


lib/
│── core/
│   ├── utils/
│       ├── constants.dart
│  
│── data/
│   ├── models/
│   │   ├── empleado_model.dart
│   ├── repositories/
│       ├── empleado_repository.dart
│── domain/
│   ├── entities/
│   │   ├── empleado.dart
│   ├── use_cases/
│       ├── insertar_empleado.dart
│── presentation/
│   ├── pages/
│   │   ├── home_page.dart
│   
│── main.dart


🧠 Lógica del Programa
Clases Principales
Empleado:

Representa un empleado con su ID y nombre.

Nodo:

Representa un nodo del árbol binario. Cada nodo tiene un empleado y referencias a sus subordinados izquierdo y derecho.

EmpleadoRepository:

Gestiona la lógica del árbol binario, incluyendo la inserción de empleados y los recorridos.

HomePage:

Interfaz de usuario que permite al usuario interactuar con el árbol binario.

Recorridos del Árbol
Preorden:

Visita los nodos en el orden: raíz → izquierdo → derecho.

Inorden:

Visita los nodos en el orden: izquierdo → raíz → derecho.

Postorden:

Visita los nodos en el orden: izquierdo → derecho → raíz.

🎨 Diseño de la Interfaz
La interfaz de usuario está diseñada en modo oscuro y es interactiva. Incluye:

Campos de texto para ingresar el ID y el nombre del empleado.

Botones para agregar empleados y limpiar el árbol.

Tarjetas (Card) para mostrar los recorridos del árbol.

🧪 Pruebas
Para probar el programa, ingresa los siguientes datos:

ID: 117, Nombre: José Morales

ID: 118, Nombre: Marcos Sánchez

ID: 119, Nombre: Elsy Palacios

Los recorridos se mostrarán de la siguiente manera:

Preorden:
ID: 117, Nombre: José Morales
ID: 118, Nombre: Marcos Sánchez
ID: 119, Nombre: Elsy Palacios

Inorden:
ID: 117, Nombre: José Morales
ID: 118, Nombre: Marcos Sánchez
ID: 119, Nombre: Elsy Palacios

Postorden:
ID: 119, Nombre: Elsy Palacios
ID: 118, Nombre: Marcos Sánchez
ID: 117, Nombre: José Morales

📄 Licencia
Este proyecto está bajo licencia libre y con fines educativos.

🤝 Contribuciones
¡Las contribuciones son bienvenidas! Si encuentras algún error o tienes una sugerencia, abre un issue o envía un pull request.

📧 Contacto
Si tienes alguna pregunta o comentario, no dudes en contactarme:

Nombre: José Gabriel Morales Galindo.

Email: joga17000@gmail.com

GitHub: gabri117