class ClientEndpoints {
  // Obtener lista de clientes
  static String getClients = "/clients";

  // Crear un nuevo cliente
  static String postCreateClient = "/clients";

  // Obtener un cliente por ID
  static String getClientById = "/clients/:id";

  // Actualizar un cliente
  static String putUpdateClient = "/clients/:id";

  // Eliminar un cliente
  static String deleteClient = "/clients/:id";
}
