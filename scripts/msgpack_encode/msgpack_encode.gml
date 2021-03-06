// @function                msgpack_encode
// @param       {buffer}    buff
// @param       {ds_map}    value
function msgpack_encode(buff, value){
    buffer_seek(buff, buffer_seek_start, 0);
    
    var scratch = buffer_create(8, buffer_fixed, 1);
    var retval = msgpack_encode_ds(buff, value, MSGPACK_DS.map, scratch);
    
    buffer_delete(scratch);
    
    return retval;
}