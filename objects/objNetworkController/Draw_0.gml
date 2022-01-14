/// @description Draw connection status
if (os_is_network_connected() && socketId >= 0 && connected >= 0) {
    draw_text(5, 5, "Connected!");
}