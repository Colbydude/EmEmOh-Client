/// @description Create network connection
SOCKET_PORT = 6969;
socketId = network_create_socket(network_socket_tcp);
connected = network_connect_raw(socketId, "127.0.0.1", SOCKET_PORT);