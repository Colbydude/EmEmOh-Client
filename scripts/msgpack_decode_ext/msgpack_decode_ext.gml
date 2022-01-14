// @function                msgpack_decode_ext
// @param       {buffer}    buff
// @param       {?}         ext_function
function msgpack_decode_ext(buff, ext_function){
    buffer_seek(buff, buffer_seek_start, 0);
    
    var scratch = buffer_create(8, buffer_fixed, 1);
    var retval = msgpack_decode_sys(buff, scratch, ext_function);
    
    buffer_delete(scratch);
    
    return retval;
}