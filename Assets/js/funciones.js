let tblUsuarios, tblClientes, tblCategorias, tblProductos;
document.addEventListener("DOMContentLoaded", function(){
    tblUsuarios = $('#tblUsuarios').DataTable( {
    ajax: {
        url: base_url + "Usuarios/listar",
        dataSrc: ''
    },
    columns: [
        {
        'data' : 'id'
        },
        {
        'data' : 'usuario'
        },
        {
        'data' : 'nombre'
        },
        {
        'data' : 'caja'
        },
        {
        'data' : 'estado'
        },
        {
        'data' : 'acciones'
        }
]
});
})
//Fin de la tabla usuario
tblClientes = $('#tblClientes').DataTable( {
    ajax: {
        url: base_url + "Clientes/listar",
        dataSrc: ''
    },
    columns: [
        {
        'data' : 'id'
        },
        {
        'data' : 'dni'
        },
        {
        'data' : 'nombre'
        },
        {
        'data' : 'telefono'
        },
        {
        'data' : 'direccion'
        },
        {
        'data' : 'estado'
        },
        {
        'data' : 'acciones'
        }
]
});
//Fin de la tabla Clientes
tblCategorias = $('#tblCategorias').DataTable( {
    ajax: {
        url: base_url + "Categorias/listar",
        dataSrc: ''
    },
    columns: [
        {
        'data' : 'id'
        },
        {
        'data' : 'nombre'
        },
        {
        'data' : 'estado'
        },
        {
        'data' : 'acciones'
        }
]
});
//Fin de la tabla Categorias
tblProductos = $('#tblProductos').DataTable( {
    ajax: {
        url: base_url + "Productos/listar",
        dataSrc: ''
    },
    columns: [
        {
        'data' : 'id'
        },
        {
        'data' : 'imagen'
        },
        {
        'data' : 'codigo'
        },
        {
        'data' : 'descripcion'
        },
        {
        'data' : 'precio_venta'
        },
        {
        'data' : 'cantidad'
        },
        {
        'data' : 'estado'
        },
        {
        'data' : 'acciones'
        }
]
});
function frmLogin(e) {
    e.preventDefault();
    const usuario = document.getElementById("usuario");
    const clave = document.getElementById("clave");
    if (usuario.value ==""){
        clave.classList.remove("is-invalid");
        usuario.classList.add("is-invalid");
        usuario.focus();
    }else if(clave.value == ""){
        usuario.classList.remove("is-invalid");
        clave.classList.add("is-invalid");
        clave.focus();
    }else{
        const url = base_url + "Usuarios/validar";
        const frm = document.getElementById("frmLogin");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if(res == "OK"){
                    window.location = base_url + "Usuarios";
                }else{
                    document.getElementById("alerta").classList.remove("d-none");
                    document.getElementById("alerta").innerHTML=res;
                }
            }
        }
    }
}
function frmUsuario(){
    document.getElementById("title").innerHTML = "Nuevo Usuario";
    document.getElementById("btnAccion").innerHTML = "Registrar";
    document.getElementById("claves").classList.remove("d-none");
    document.getElementById("frmUsuario").reset();
    $("#nuevo_usuario").modal("show");
    document.getElementById("id").value = "";
}
function registrarUser(e) {
    e.preventDefault();
    const usuario = document.getElementById("usuario");
    const nombre = document.getElementById("nombre");
    const clave = document.getElementById("clave");
    const confirmar = document.getElementById("confirmar");
    const caja = document.getElementById("caja");
    if (usuario.value == "" || nombre.value == "" || caja.value == ""){
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Todos los campos son obligatorios',
            showConfirmButton: false,
            timer: 3000
            })
    }else{
        const url = base_url + "Usuarios/registrar";
        const frm = document.getElementById("frmUsuario");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "si"){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Usuario registrado con éxito',
                    showConfirmButton: false,
                    timer: 3000
            })
            frm.reset();
            $("#nuevo_usuario").modal("hide");
            tblUsuarios.ajax.reload();
        }else if (res == "modificado"){
            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Usuario modificado con éxito',
            showConfirmButton: false,
            timer: 3000
            })
            $("#nuevo_usuario").modal("hide");
            tblUsuarios.ajax.reload();
        }else{
            Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: res,
            showConfirmButton: false,
            timer: 3000
            })
        }
      }
    }
}
}
function btnEditarUser(id){
    document.getElementById("title").innerHTML = "Actualizar Usuario";
    document.getElementById("btnAccion").innerHTML = "Modificar";
        const url = base_url + "Usuarios/editar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                document.getElementById("id").value = res.id;
                document.getElementById("usuario").value = res.usuario;
                document.getElementById("nombre").value = res.nombre;
                document.getElementById("caja").value = res.id_caja;
                document.getElementById("claves").classList.add("d-none");
                $("#nuevo_usuario").modal("show");
            }
    }
}
function btnEliminarUser(id){
    Swal.fire({
  title: 'Esta seguro de eliminar?',
  text: "El usuario no se eliminara de forma permamente, solo cambiará el estado a inactivo!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Usuarios/eliminar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Usuario eliminado con éxito.',
                    'success'
                    )
                    tblUsuarios.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
function btnReingresarUser(id){
    Swal.fire({
  title: 'Esta seguro de reingresar?',
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Usuarios/reingresar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Usuario reingresado con éxito.',
                    'success'
                    )
                    tblUsuarios.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
//findeusuarios
function frmCliente(){
    document.getElementById("title").innerHTML = "Nuevo Cliente";
    document.getElementById("btnAccion").innerHTML = "Registrar";
    document.getElementById("frmCliente").reset();
    $("#nuevo_cliente").modal("show");
    document.getElementById("id").value = "";
}
function registrarCli(e) {
    e.preventDefault();
    const dni = document.getElementById("dni");
    const nombre = document.getElementById("nombre");
    const telefono = document.getElementById("telefono");
    const direccion = document.getElementById("direccion");
    if (dni.value == "" || nombre.value == "" || telefono.value == "" || direccion.value == ""){
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Todos los campos son obligatorios',
            showConfirmButton: false,
            timer: 3000
            })
    }else{
        const url = base_url + "Clientes/registrar";
        const frm = document.getElementById("frmCliente");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "si"){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Cliente registrado con éxito',
                    showConfirmButton: false,
                    timer: 3000
            })
            frm.reset();
            $("#nuevo_¿cliente").modal("hide");
            tblClientes.ajax.reload();
        }else if (res == "modificado"){
            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Cliente modificado con éxito',
            showConfirmButton: false,
            timer: 3000
            })
            $("#nuevo_cliente").modal("hide");
            tblClientes.ajax.reload();
        }else{
            Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: res,
            showConfirmButton: false,
            timer: 3000
            })
        }
      }
    }
}
}
function btnEditarCli(id){
    document.getElementById("title").innerHTML = "Actualizar Cliente";
    document.getElementById("btnAccion").innerHTML = "Modificar";
        const url = base_url + "Clientes/editar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                document.getElementById("id").value = res.id;
                document.getElementById("dni").value = res.dni;
                document.getElementById("nombre").value = res.nombre;
                document.getElementById("telefono").value = res.telefono;
                document.getElementById("direccion").value = res.direccion;
                $("#nuevo_cliente").modal("show");
            }
    }
}
function btnEliminarCli(id){
    Swal.fire({
  title: 'Esta seguro de eliminar?',
  text: "El usuario no se eliminara de forma permamente, solo cambiará el estado a inactivo!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Clientes/eliminar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Cliente eliminado con éxito.',
                    'success'
                    )
                    tblClientes.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
function btnReingresarCli(id){
    Swal.fire({
  title: 'Esta seguro de reingresar?',
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Clientes/reingresar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Cliente reingresado con éxito.',
                    'success'
                    )
                    tblClientes.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
//Fin de clientes
function frmCategoria(){
    document.getElementById("title").innerHTML = "Nueva Categoria";
    document.getElementById("btnAccion").innerHTML = "Registrar";
    document.getElementById("frmCategoria").reset();
    $("#nuevo_categoria").modal("show");
    document.getElementById("id").value = "";
}
function registrarCate(e) {
    e.preventDefault();
    const nombre = document.getElementById("nombre");
    if (nombre.value == ""){
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Todos los campos son obligatorios',
            showConfirmButton: false,
            timer: 3000
            })
    }else{
        const url = base_url + "Categorias/registrar";
        const frm = document.getElementById("frmCategoria");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "si"){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Categoria registrado con éxito',
                    showConfirmButton: false,
                    timer: 3000
            });
            frm.reset();
            $("#nuevo_categoria").modal("hide");
            tblCategorias.ajax.reload();
        }else if (res == "modificado"){
            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Categoria modificado con éxito',
            showConfirmButton: false,
            timer: 3000
            })
            $("#nuevo_categoria").modal("hide");
            tblCategorias.ajax.reload();
        }else{
            Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: res,
            showConfirmButton: false,
            timer: 3000
            })
        }
      }
    }
}
}
function btnEditarCate(id){
    document.getElementById("title").innerHTML = "Actualizar categoria";
    document.getElementById("btnAccion").innerHTML = "Modificar";
        const url = base_url + "Categorias/editar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                document.getElementById("nombre").value = res.nombre;
                $("#nuevo_categoria").modal("show");
            }
    }
}
function btnEliminarCate(id){
    Swal.fire({
  title: 'Esta seguro de eliminar?',
  text: "La categoria no se eliminara de forma permamente, solo cambiará el estado a inactivo!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Categorias/eliminar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Categoria eliminado con éxito.',
                    'success'
                    )
                    tblCategorias.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
function btnReingresarCate(id){
    Swal.fire({
  title: 'Esta seguro de reingresar?',
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Categorias/reingresar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Categoria reingresado con éxito.',
                    'success'
                    )
                    tblCategorias.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
//Fin de Categorias
function frmProducto(){
    document.getElementById("title").innerHTML = "Nuevo Producto";
    document.getElementById("btnAccion").innerHTML = "Registrar";
    document.getElementById("frmProducto").reset();
    document.getElementById("id").value = "";
    $("#nuevo_producto").modal("show");
    deleteImg();
}
function registrarPro(e) {
    e.preventDefault();
    const codigo = document.getElementById("codigo");
    const nombre = document.getElementById("nombre");
    const precio_compra = document.getElementById("precio_compra");
    const precio_venta = document.getElementById("precio_venta");
    const id_cat = document.getElementById("categoria");
    if (codigo.value == "" || nombre.value == "" || precio_compra.value == "" || precio_venta.value == ""){
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Todos los campos son obligatorios',
            showConfirmButton: false,
            timer: 3000
            })
    }else{
        const url = base_url + "Productos/registrar";
        const frm = document.getElementById("frmProducto");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "si"){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Producto registrado con éxito',
                    showConfirmButton: false,
                    timer: 3000
            })
            frm.reset();
            $("#nuevo_producto").modal("hide");
            tblProductos.ajax.reload();
        }else if (res == "modificado"){
            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Producto modificado con éxito',
            showConfirmButton: false,
            timer: 3000
            })
            $("#nuevo_producto").modal("hide");
            tblProductos.ajax.reload();
        }else{
            Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: res,
            showConfirmButton: false,
            timer: 3000
            })
        }
      }
    }
}
}
function btnEditarPro(id){
    document.getElementById("title").innerHTML = "Actualizar Producto";
    document.getElementById("btnAccion").innerHTML = "Modificar";
        const url = base_url + "Productos/editar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                document.getElementById("id").value = res.id;
                document.getElementById("codigo").value = res.codigo;
                document.getElementById("nombre").value = res.descripcion;
                document.getElementById("precio_compra").value = res.precio_compra;
                document.getElementById("precio_venta").value = res.precio_venta;
                document.getElementById("categoria").value = res.id_categoria;
                document.getElementById("img-preview").src = base_url + 'Assets/img/' + res.foto;
                document.getElementById("icon-cerrar").innerHTML = `
                <button class="btn btn-danger" onclick="deleteImg()">
                <i class="fas fa-times"></i></button>`;
                document.getElementById("icon-image").classList.add("d-none");
                document.getElementById("foto_actual").value = res.foto;
                $("#nuevo_producto").modal("show");
            }
    }
}
function btnEliminarPro(id){
    Swal.fire({
  title: 'Esta seguro de eliminar?',
  text: "El producto no se eliminara de forma permamente, solo cambiará el estado a inactivo!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Productos/eliminar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Producto eliminado con éxito.',
                    'success'
                    )
                    tblProductos.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
function btnReingresarPro(id){
    Swal.fire({
  title: 'Esta seguro de reingresar?',
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: 'Si!',
  cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Productos/reingresar/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                    'Mensaje!',
                    'Producto reingresado con éxito.',
                    'success'
                    )
                    tblProductos.ajax.reload();
                }else{
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}
function preview(e){
    const url = e.target.files[0];
    const urlTmp = URL.createObjectURL(url);
    document.getElementById("img-preview").src = urlTmp;
    document.getElementById("icon-image").classList.add("d-none");
    document.getElementById("icon-cerrar").innerHTML = `
    <button class="btn btn-danger" onclick="deleteImg()"><i class="fas fa-times"></i></button>
    ${url['name']}`;
}
function deleteImg(){
    document.getElementById("icon-cerrar").innerHTML = '';
    document.getElementById("icon-image").classList.remove("d-none");
    document.getElementById("img-preview").src = '';
    document.getElementById("imagen").value = '';
    document.getElementById("foto_actual").value = '';
}
function buscarCodigo(e){
    e.preventDefault();
    if (e.which == 13) {
    const cod = document.getElementById("codigo").value;
    const url = base_url + "Compras/buscarCodigo/"+ cod;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            const res = JSON.parse(this.responseText);
           if (res) {
            document.getElementById("nombre").value = res.descripcion;
            document.getElementById("precio").value = res.precio_compra;
            document.getElementById("id").value = res.id;
            document.getElementById("cantidad").focus();
           }else{
              Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'El producto no existe',
            showConfirmButton: false,
            timer: 2000
            })
             document.getElementById("codigo").value = '';
              document.getElementById("codigo").focus();
           }
        }
    }
   }
}
function calcularPrecio(e){
    e.preventDefault();
    const cant = document.getElementById("cantidad").value;
    const precio = document.getElementById("precio").value;
    document.getElementById("sub_total").value = precio * cant;
    if (e.which == 13) {
        if (cant > 0) {
        const url = base_url + "Compras/ingresar";
        const frm = document.getElementById("frmCompra");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            const res = JSON.parse(this.responseText);
            if (res ==  'ok') {
                alert('Ingresado');
                frm.reset();
                cargarDetalle();
            }else if(res == 'modificado'){
                alert('Producto actualizado');
                 frm.reset();
                cargarDetalle();
            }
           }
         }
        }
    }
}
cargarDetalle();
function cargarDetalle(){
        const url = base_url + "Compras/listar";
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            const res = JSON.parse(this.responseText);
            let html = '';
            res.detalle.forEach(row => {
                html += `<tr>
                <td>${row['id']}</td>
                <td>${row['descripcion']}</td>
                <td>${row['cantidad']}</td>
                <td>${row['precio']}</td>
                <td>${row['sub_total']}</td>
                <td>
                <button class="btn btn-danger" type="button" onclick="deleteDetalle(${row['id']})">
                <i class="fas fa-trash-alt"></i></button>
                </td>
                </tr>`;
            });
            document.getElementById("tblDetalle").innerHTML = html;
            document.getElementById("total").value = res.total_pagar.total;
           }
         }
}
function deleteDetalle(id)
{
    const url = base_url + "Compras/delete/"+id;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            const res = JSON.parse(this.responseText);
           if (res == 'ok') {
            Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Producto eliminado',
            showConfirmButton: false,
            timer: 3000
            })
            cargarDetalle();
        }else{
            Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Error al eliminar el producto',
            showConfirmButton: false,
            timer: 3000
            })
        }
           }
         }
}
function generarCompra(){
    Swal.fire({
        title: 'Esta seguro de realizar la compra?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
}).then((result) => {
  if (result.isConfirmed) {
        const url = base_url + "Compras/registrarCompra";
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function () {
            if(this.readyState == 4 && this.status == 200){
                const res = JSON.parse(this.responseText);
                if (res == "ok") {
                    Swal.fire(
                        'Mensaje!',
                        'Compra generada',
                        'success'
                    )
                } else {
                    Swal.fire(
                    'Mensaje!',
                    res,
                    'error'
                    )
                }
            }
    }
}
})
}

//Fin de Productos