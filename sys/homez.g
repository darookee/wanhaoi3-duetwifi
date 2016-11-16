G91                ; relative mode
G1 Z4 F200         ; raise head 4mm to ensure it is above the Z probe trigger height
G1 Z-210 F200 S1   ; move down to 210mm in the -Z direction, stopping if the homing switch is triggered
G90                ; back to absolute mode
