/// @description Handle Networking Events
show_debug_message("Network data received");

var eventType = async_load[? "type"];

if (eventType == network_type_data) {
    var eventData = msgpack_decode(async_load[? "buffer"]);
    var dataSize = async_load[? "size"];
    var header = eventData[? "header"];
    show_debug_message("Data: " + string(header));
    show_debug_message("Size: " + string(dataSize));
    
    if (header == PacketType.PlayerTransform) {
        var playerTransformMap = eventData[? "transform"];
        
        instance_create_layer(playerTransformMap[? "X"], playerTransformMap[? "Y"], "Instances", objPuppet);
        
        with (objPuppet) {
            playerId = playerTransformMap[? "ID"];
        }
    }
    else if (header == PacketType.PlayerList) {
        var existingPlayers = ds_list_size(eventData[? "players"]);
        show_debug_message("Players already connected: " + string(existingPlayers));
        
        // Spawn puppets.
        for (var i = 0; i < existingPlayers; i++) {
            var playerTransformMap = eventData[? "players"][| i];
            
            instance_create_layer(playerTransformMap[? "X"], playerTransformMap[? "Y"], "Instances", objPuppet);
            
            with (objPuppet) {
                playerId = playerTransformMap[? "ID"];
            }
        }
    }
}