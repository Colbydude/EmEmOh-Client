/// @description Handle Networking Events
show_debug_message("Network data received");

var eventType = async_load[? "type"];

if (eventType == network_type_data) {
    var eventData = msgpack_decode(async_load[? "buffer"]);
    var dataSize = async_load[? "size"];
    show_debug_message("Data: " + string(eventData[? "header"]));
    show_debug_message("Size: " + string(dataSize));
}