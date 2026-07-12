# 🏆 SistemaSports

Sistema web de gestión de ventas e inventario para una tienda de artículos deportivos, desarrollado con **PHP**, **MySQL** y una arquitectura **Modelo - Vista - Controlador (MVC)**. El sistema permite administrar productos, categorías, clientes, compras y usuarios mediante una interfaz web moderna e intuitiva.

---

## 📖 Descripción

**SistemaSports** fue desarrollado con el objetivo de digitalizar y optimizar la administración de una tienda de artículos deportivos, centralizando la gestión del inventario y las operaciones comerciales en una sola plataforma.

El proyecto implementa una arquitectura MVC propia, facilitando el mantenimiento, organización y escalabilidad del código.

---

# ✨ Características

- 🔐 Inicio de sesión con autenticación de usuarios.
- 📊 Dashboard administrativo.
- 👤 Gestión de usuarios.
- 👥 Gestión de clientes.
- 🏷️ Gestión de categorías.
- 📦 Gestión de productos.
- 🛒 Registro de compras.
- 📈 Control de inventario.
- 📱 Diseño responsive.
- 📋 Tablas dinámicas con DataTables.
- 🔔 Alertas mediante SweetAlert2.

---

# 🚀 Tecnologías utilizadas

| Tecnología | Descripción |
|------------|-------------|
| PHP | Desarrollo Backend |
| MySQL | Base de datos |
| HTML5 | Estructura |
| CSS3 | Estilos |
| JavaScript | Funcionalidad |
| Bootstrap | Diseño Responsive |
| jQuery | Interactividad |
| DataTables | Tablas dinámicas |
| SweetAlert2 | Alertas |
| Apache (XAMPP) | Servidor Web |

---

# 📁 Estructura del proyecto

```text
SistemaSports
│
├── Assets
│   ├── css
│   ├── demo
│   ├── img
│   └── js
│
├── Capturas
│   ├── Captura 1.png
│   ├── Captura 2.png
│   ├── Captura 3.png
│   ├── Captura 4.png
│   ├── Captura 5.png
│   └── Captura 6.png
│
├── Config
│   ├── App
│   └── Config.php
│
├── Controllers
│   ├── Categorias.php
│   ├── Clientes.php
│   ├── Compras.php
│   ├── Home.php
│   ├── Productos.php
│   └── Usuarios.php
│
├── Database
│   └── sistema_ventas.sql
│
├── Models
│   ├── CategoriasModel.php
│   ├── ClientesModel.php
│   ├── ComprasModel.php
│   ├── HomeModel.php
│   ├── ProductosModel.php
│   └── UsuariosModel.php
│
├── Views
│   ├── Categorias
│   ├── Clientes
│   ├── Compras
│   ├── Productos
│   ├── Templates
│   ├── Usuarios
│   └── index.php
│
├── .htaccess
└── index.php
```

---

# ⚙️ Requisitos

- PHP 8.0 o superior
- MySQL o MariaDB
- Apache
- XAMPP o Laragon

---

# 💻 Instalación

## 1. Clonar el repositorio

```bash
git clone https://github.com/lidisching-hue/sistemasports.git
```

## 2. Copiar el proyecto

Mover la carpeta a:

```text
xampp/htdocs/
```

## 3. Crear la base de datos

Abrir **phpMyAdmin**.

Crear la base de datos:

```text
sistema_ventas
```

Importar el archivo:

```text
Database/sistema_ventas.sql
```

## 4. Configurar la conexión

Editar el archivo:

```text
Config/Config.php
```

Configurar los parámetros de conexión según el entorno.

Ejemplo:

```php
$host = "localhost";
$user = "root";
$password = "";
$database = "sistema_ventas";
```

## 5. Ejecutar el proyecto

Iniciar **Apache** y **MySQL** desde XAMPP.

Abrir en el navegador:

```text
http://localhost/SistemaSports
```

---

# 🏛 Arquitectura MVC

El proyecto implementa el patrón **Modelo - Vista - Controlador (MVC)**.

### 📂 Models

Encargados del acceso a la base de datos.

- CategoriasModel
- ClientesModel
- ComprasModel
- HomeModel
- ProductosModel
- UsuariosModel

### 📂 Controllers

Gestionan la lógica del negocio y las solicitudes del usuario.

- Categorias
- Clientes
- Compras
- Home
- Productos
- Usuarios

### 📂 Views

Contienen toda la interfaz gráfica del sistema.

- Categorías
- Clientes
- Compras
- Productos
- Usuarios
- Templates

---

# 🖼 Capturas del sistema

## 🔐 Captura 1

![Inicio](Capturas/Captura%201.png)

---

## 📊 Captura 2

![Dashboard](Capturas/Captura%202.png)

---

## 📦 Captura 3

![Productos](Capturas/Captura%203.png)

---

## 👥 Captura 4

![Clientes](Capturas/Captura%204.png)

---

## 🛒 Captura 5

![Compras](Capturas/Captura%205.png)

---

## 👤 Captura 6

![Usuarios](Capturas/Captura%206.png)

---

# 📌 Funcionalidades principales

- Administración de usuarios.
- Administración de clientes.
- Administración de categorías.
- Administración de productos.
- Registro de compras.
- Gestión del inventario.
- Dashboard administrativo.
- Interfaz responsive.
- Organización mediante arquitectura MVC.

---

# 👨‍💻 Autor

**Lidis Chinguel Aponte**

Estudiante de Ingeniería de Sistemas

Universidad César Vallejo – Perú

GitHub:

https://github.com/lidisching-hue

---

# ⭐ Si este proyecto te resulta útil

Puedes dejar una ⭐ en el repositorio para apoyar el proyecto y clonalo.

---

# 📄 Licencia

Este proyecto fue desarrollado con fines académicos y de aprendizaje. Su uso es libre para propósitos educativos, conservando los créditos del autor.
