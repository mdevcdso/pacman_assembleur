;****************************************
;   Pac Man game rmaster deluxe edition
; =======================================
;****************************************
include LIBGFX.INC

pile    segment stack     ; Segment de pile
pile    ends

donnees segment public    ; Segment de donnees 

; +++++++++++++++++++++++++++++++++++++++++++++
;               CONSTANTES
; +++++++++++++++++++++++++++++++++++++++++++++
; ============- PAC MAN ICONS =====================
pacr  DW   15, 225
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,44,44,44,44,44,44,44,0,0,0,0,0,0,0,44,44,44,44,44,44,44,0,0,0,0,0,0,0,0,44,44,44,44,44,44,0,0,0,0,0,0,0,0,44
    DB 44,44,44,44,44,0,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,44,44,44,44,0,0,0,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,44,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,44,44,44,44
    DB 44,44,0,0,0,0,0,0,0,0,0,44,44,44,44,44,44,44,0,0,0,0,0,0,0,0,0,44,44,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
man  DW   15, 225
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,44,44,44,44,44,44,44,44,44,0,0,0,0,0,44,44,44,44,44,44,44,44,44,44,44,0,0,0,0,44,44,44,44,44,44,44,44,44,44,44,0,0,0,44,44,44
    DB 44,44,44,44,44,44,44,44,44,44,0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,44,44,44,44,44,44,44,44,44,44,44,44,44,0,0,0,44,44,44,44,44,44
    DB 44,44,44,44,44,0,0,0,0,44,44,44,44,44,44,44,44,44,44,44,0,0,0,0,0,44,44,44,44,44,44,44,44,44,0,0,0,0,0,0,0,0,44,44,44,44,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
pacl DW 15,225
    DB  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB  0,0,0,44,44,44,44,44,0,0,0,0,0,0,0
    DB  0,0,0,44,44,44,44,44,44,44,0,0,0,0,0
    DB  0,0,0,0,44,44,44,44,44,44,44,0,0,0,0
    DB  0,0,0,0,0,44,44,44,44,44,44,0,0,0,0
    DB  0,0,0,0,0,0,44,44,44,44,44,44,0,0,0
    DB  0,0,0,0,0,0,0,44,44,44,44,44,0,0,0
    DB  0,0,0,0,0,0,0,0,44,44,44,44,0,0,0
    DB  0,0,0,0,0,0,0,44,44,44,44,44,0,0,0
    DB  0,0,0,0,0,0,44,44,44,44,44,44,0,0,0
    DB  0,0,0,0,0,44,44,44,44,44,44,0,0,0,0
    DB  0,0,0,0,44,44,44,44,44,44,44,0,0,0,0
    DB  0,0,0,44,44,44,44,44,44,44,0,0,0,0,0
    DB  0,0,0,44,44,44,44,44,0,0,0,0,0,0,0
    DB  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
pact DW 15,225
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,44,44,0,0,0,0,0,0,0,0,0,44,44,0
    DB 0,44,44,44,0,0,0,0,0,0,0,44,44,44,0
    DB 0,44,44,44,44,0,0,0,0,0,44,44,44,44,0
    DB 0,44,44,44,44,44,0,0,0,44,44,44,44,44,0
    DB 0,44,44,44,44,44,44,0,44,44,44,44,44,44,0
    DB 0,0,44,44,44,44,44,44,44,44,44,44,44,0,0
    DB 0,0,44,44,44,44,44,44,44,44,44,44,44,0,0
    DB 0,0,0,44,44,44,44,44,44,44,44,44,0,0,0
    DB 0,0,0,0,0,44,44,44,44,44,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
pacb DW 15,225
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,44,44,44,44,44,0,0,0,0,0
    DB 0,0,0,44,44,44,44,44,44,44,44,44,0,0,0
    DB 0,0,44,44,44,44,44,44,44,44,44,44,44,0,0
    DB 0,0,44,44,44,44,44,44,44,44,44,44,44,0,0
    DB 0,44,44,44,44,44,44,0,44,44,44,44,44,44,0
    DB 0,44,44,44,44,44,0,0,0,44,44,44,44,44,0
    DB 0,44,44,44,44,0,0,0,0,0,44,44,44,44,0
    DB 0,44,44,44,0,0,0,0,0,0,0,44,44,44,0
    DB 0,44,44,0,0,0,0,0,0,0,0,0,44,44,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

    




nfo1   DB "LONEVADER:$"
nfo2   DB "=============$"
nfo3   DB "   fleches  -> change la direction du robot$"
nfo4   DB "   touche * -> quitte le jeu$"
nfo5   DB "   !! eviter le mur rouge !!$"
nfo6   DB "... press any Key to start$"

; +++++++++++++++++++++++++++++++++++++++++++++
;               VARIABLES
; +++++++++++++++++++++++++++++++++++++++++++++
cycle DB  0
direction DB 0
posX  DW  5
posY  DW  10

donnees ends    ; ********** FIN Segment de donnees ************

; +++++++++++++++++++++++++++++++++++++++++++++
;               PROGRAMME
; +++++++++++++++++++++++++++++++++++++++++++++
code    segment public        ; Segment de code
assume  cs:code,ds:donnees,es:code,ss:pile

prog:
; ================== Gestion des arguments =========
    mov BX, 80h             ; offset in PSP for argument length
    mov CH, byte ptr[BX]    ; CH = argument length 
    
; ================== Gestion des donnees =========
    mov AX, donnees         ; set DS on program data segment
    mov DS, AX
    
; =================== Programme ===================
    call Help               ; Instructions
    
    mov Rx, 0               ; screen limits
    mov Ry, 0
    cmp CH, 0               ; test number of arguments
    jz no_args              
    CALL VideoVGA           ; args --> 640x480
    mov Rh, 479
    mov Rw, 639
    mov col, 44             ; Yellow border
    call Rectangle
    jmp debut  
 no_args:
    CALL Video13h           ; no args --> 320x200
    mov Rh, 199
    mov Rw, 319
    mov col, 36             ; Magenta border
    call Rectangle
    
 debut:
    mov col, 0
    mov pX, 0
    mov pY, 1
    
; ========== game initialisation ================    
    mov tempo, 20
    
    mov Rx, 50
    mov Ry, 20
    mov Rh, 50
    mov Rw, 10
    mov col, 1
    call fillRect
    mov Rx, 100            
    mov Ry, 10
    mov Rh, 50
    mov Rw, 10
    mov col, 9
    call Rectangle

; ========== GAME LOOP ===============
gameloop:  
    call dessine
    call docycle
    call sleep
    call interact
    call isdead
    jmp gameloop
; ====================================
   
; =============================
;      ROUTINES
; =============================
;------------Sub Help    -----------
Help:
    call ClearScreen
    mov DX, offset nfo1
    call CharLine
    mov DX, offset nfo2
    call CharLine
    mov DX, offset nfo3
    call CharLine
    mov DX, offset nfo4
    call CharLine
    mov DX, offset nfo5
    call CharLine
    mov DX, offset nfo6
    call CharLine
    call WaitKey
    ret
    
;--------- dessine ------------ 
; cycle <<  
dessine:
    mov AX, posX
    mov iX, AX
    mov AX, posY
    mov iY, AX

    cmp direction, 0        ; droite
    je  d_right
    cmp direction, 1        ; gauche
    je  d_left
    cmp direction, 2        ; up
    je  d_top
    cmp direction, 3        ; down
    je  d_bot
    jmp d_right             ; sécurité

d_right:
    cmp cycle, 0
    jne dr1
    mov BX, offset man
    jmp d_draw
dr1:
    mov BX, offset pacr
    jmp d_draw

d_left:
    cmp cycle, 0
    jne dl1
    mov BX, offset man
    jmp d_draw
dl1:
    mov BX, offset pacl
    jmp d_draw

d_top:
    cmp cycle, 0
    jne dt1
    mov BX, offset man
    jmp d_draw
dt1:
    mov BX, offset pact
    jmp d_draw

d_bot:
    cmp cycle, 0
    jne db1
    mov BX, offset man
    jmp d_draw
db1:
    mov BX, offset pacb

d_draw:
    CALL drawIcon
    RET


;------- docycle ---------------
; >> posX, cycle
docycle:
    cmp direction, 0   ; move right
    jne moveL
    inc posX
    jmp cycle1
moveL:                 ; move left
    cmp direction, 1
    jne moveU
    dec posX
    jmp cycle1
moveU:
    cmp direction, 2
    jne moveD
    dec posY
    jmp cycle1
moveD:
    inc posY
    
cycle1:                ; change cycle 0-1
    cmp cycle, 0
    jne cycle0
    mov cycle, 1
    RET
cycle0:
    mov cycle, 0
    RET
     
;------- interact ---------------
; >> direction
interact:
    call PeekKey
    cmp userinput, '*'
    jne  testR
    call VideoCMD
    mov AH,4Ch          ; fin de prog DOS
    mov AL,00h      
    int 21h       
testR:
    CMP userinput,'M'   ; M for right
    JNE testL
    MOV direction, 0
    RET
testL:
    CMP userinput,'K'   ; K for left
    JNE testU
    MOV direction, 1
    RET
testU:
    CMP userinput,'H'   ; H for up
    JNE testD 
    MOV direction, 2
    RET
testD:
    CMP userinput,'P'   ; P for down
    JNE noHit
    MOV direction, 3
    RET
noHit:
    RET
     
;------- isdead ---------------
; posX, posX >>
isdead:

    ; --- coin haut-gauche ---
    mov AX, posX
    mov pX, AX
    mov AX, posY
    mov pY, AX
    call ReadPxl
    cmp rdcol, 1
    je dead

    ; --- coin haut-droit ---
    mov AX, posX
    add AX, 15
    mov pX, AX
    mov AX, posY
    mov pY, AX
    call ReadPxl
    cmp rdcol, 1
    je dead

    ; --- coin bas-gauche ---
    mov AX, posX
    mov pX, AX
    mov AX, posY
    add AX, 15
    mov pY, AX
    call ReadPxl
    cmp rdcol, 1
    je dead

    ; --- coin bas-droit ---
    mov AX, posX
    add AX, 15
    mov pX, AX
    mov AX, posY
    add AX, 15
    mov pY, AX
    call ReadPxl
    cmp rdcol, 1
    je dead

    ret

dead:
    call VideoCMD
    mov AH,4Ch
    mov AL,00h
    int 21h


notDead:
    ret

; ================= FIN DU CODE ===============
code    ends                   ; Fin du segment de code
end prog                         ; Fin du programme
