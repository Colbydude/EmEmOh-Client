draw_self();

if (playerId != undefined) {
    draw_set_halign(fa_center);
    draw_text(x, y - 24, string(playerId));
    draw_set_halign(fa_left);
}