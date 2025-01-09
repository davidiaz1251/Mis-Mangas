# 📚 Mis Mangas

**Mis Mangas** es una aplicación desarrollada en **SwiftUI** como parte del proyecto final del **Swift Developer Program 2024** de Apple Coding Academy.  
La app permite gestionar una colección personal de mangas, consultando datos desde una API REST, y almacenando información localmente con **SwiftData**.

---

## 🛠 Funcionalidades

### Versión Básica
- Listado de mangas consultados desde la API.
- Guardar mangas en una colección personal con información sobre:
  - Número de tomos comprados.
  - Tomo en lectura.
  - Si la colección está completa.
- Persistencia local con **SwiftData**.
- Vista de detalle de manga con información ampliada.
- Interfaz optimizada para iPhone y iPad.

### Escalabilidad
El proyecto está diseñado para evolucionar hacia:
- Gestión en la nube con autenticación.
- Filtros avanzados por géneros, temas y demografías.
- Soporte multiplataforma (macOS, Apple Watch).
- Widgets estáticos para mostrar el progreso de lectura.

---

## 🧑‍💻 Tecnologías utilizadas

- **SwiftUI**: Para crear la interfaz de usuario.
- **SwiftData**: Persistencia local moderna.
- **async/await**: Manejo eficiente de concurrencia.
- **@Observable**: Para la gestión reactiva de estados en vistas.
- **WidgetKit** (para futuras versiones).

---

## 🚀 Instalación y uso

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/mis-mangas.git
   cd mis-mangas
   ```

2. Abre el proyecto en Xcode:
   ```bash
   open MisMangas.xcodeproj
   ```

3. Asegúrate de usar:
   - **Xcode 15 o superior**.
   - **iOS 17 como mínimo**.

4. Ejecuta el proyecto en un simulador o dispositivo físico.

---

## 🌐 Endpoints utilizados

### API Base
`https://api.mismangas.com`

#### Listados
- `/list/mangas`: Obtiene mangas paginados.
- `/mangaByGenre/{genre}`: Mangas filtrados por género.
- `/manga/{id}`: Detalle de un manga específico.

#### Usuarios (para versiones avanzadas)
- `/users`: Registro y autenticación.
- `/collection/manga`: Gestión de la colección del usuario.

---

## 🗂 Estructura del proyecto

```
MisMangas/
├── Models/           # Modelos de datos persistentes con SwiftData
├── DTOs/             # Modelos para la comunicación con la API
├── Services/         # Lógica de red (API REST)
├── ViewModels/       # Lógica reactiva para las vistas
├── Views/            # Interfaz de usuario en SwiftUI
└── Utils/            # Extensiones y helpers
```

---

## ✨ Próximos pasos

1. Implementar autenticación de usuarios con persistencia de tokens en Keychain.
2. Añadir filtros avanzados para la búsqueda de mangas.
3. Sincronización completa de la colección en la nube.
4. Soporte multiplataforma (macOS, Apple Watch).
5. Widgets con **WidgetKit**.

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si tienes ideas o encuentras errores, abre un **issue** o envía un **pull request**.

---

## 📝 Licencia

Este proyecto está bajo la [Licencia MIT](LICENSE).
