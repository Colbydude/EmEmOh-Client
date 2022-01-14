/// @description Close connection and game
network_destroy(socketId);
socketId = -1;
connected = -1;
game_end();