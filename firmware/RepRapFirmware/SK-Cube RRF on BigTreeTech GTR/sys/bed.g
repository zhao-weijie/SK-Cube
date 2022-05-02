; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.2.2 on Thu Jan 28 2021 12:21:33 GMT+0800 (Taipei Standard Time)

; ---------------------------------------------------------------------
; G31: Set or Report Current Probe status
; G32: Run bed.g macro
;
; Please refer to "Inductive ABL sensor setup" and find a proper value
; for G31 Z parameter.
; https://sites.google.com/view/seckit-wiki/sk-tank-350x350x400/sk-tank-tuning/inductive-abl-sensor-setup

M561                               ; clear any bed transform. treat the bed as an ideal flat surface.
; Don't use parameter P of M558 here as it will reset probe offsets assigned in G31.
M558 H7 F420 T18000                ; set a higher dive height H20 to prevent nozzle crash. 
G28
G30 P0 X5   Y35  Z-99999			; coordinate of the probe
G30 P1 X200 Y35  Z-99999			; coordinate of the probe
G30 P2 X100 Y200 Z-99999 S3			; coordinate of the probe
; Don't use parameter P of M558 here as it will reset probe offsets assigned in G31.
M558 H3 F420 T12000                ; set a low dive height H3 for faster mesh building.
G1 X100 Y100 Z10 F9000

;----------------------------------------
; uncomment below to include mesh building in G32
;----------------------------------------
;M561 ; clear any bed transform. treat the bed as an ideal flat surface.
;G29  ; probe the bed and enable compensation


