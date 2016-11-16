G91                ; relative mode
G1 Z4 F200         ; raise head 4mm
G1 X-240 Y-240 F3000 S1  ; move up to 240mm in the -X and -Y directions until the homing switches are triggered
G1 X4 Y4 F600      ; move slowly 6mm in +X and +Y directions
G1 X-10 Y-10 S1    ; move up to 10mm in the -X and -Y directions until the homing switches are triggered
G1 Z-210 F200 S1         ; home z
G90                ; back to absolute mode
