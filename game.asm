;****************************************
;   Pac Man game rmaster deluxe edition
; =======================================
;****************************************
include LIBGFX.INC

EXTRN  image:WORD        ; sprite du fantome (défini dans ghost.asm)

pile    segment stack
    dw 128 dup(?)
pile    ends

donnees segment public

; =================================================
;             SPRITES PACMAN 15x15
; =================================================
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


; =================================================
;             LABYRINTHE 19 x 16 cases
; =================================================
MAZE_W   EQU 19
MAZE_H   EQU 16
TILE_W   EQU 15
TILE_H   EQU 15
MAZE_X0  EQU 40
MAZE_Y0  EQU 20

WALL_MARG EQU 2                         ; marge vide autour du mur dans la case
WALL_W    EQU TILE_W-2*WALL_MARG        ; 11
WALL_H    EQU TILE_H-2*WALL_MARG        ; 11

; pastilles (petits carrés 3x3 au centre des cases '.')
PELLET_W   EQU 3
PELLET_H   EQU 3
PELLET_COL EQU 44
PELLET_OFFX EQU (TILE_W-PELLET_W)/2     ; 6
PELLET_OFFY EQU (TILE_H-PELLET_H)/2     ; 6

; X = mur, . = passage avec pastille
maze    DB 'XXXXXXXXXXXXXXXXXXX'
        DB 'X.................X'
        DB 'X.XXX.XXX.X.XXX.X.X'
        DB 'X.X.......X.....X.X'
        DB 'X.X.XXX.X.X.XXX.X.X'
        DB 'X.....X...X.X.....X'
        DB 'XXX.X.XXXXX.X.XXX.X'
        DB 'X.................X'
        DB 'X.XXX.X.X.X.X.XXX.X'
        DB 'X.X...X...X...X.X.X'
        DB 'X.X.XXXXX.XXXXX.X.X'
        DB 'X.X.............X.X'
        DB 'X.XXX.XXX.XXX.XXX.X'
        DB 'X.................X'
        DB 'X.................X'
        DB 'XXXXXXXXXXXXXXXXXXX'

; =================================================
;                 TEXTES
; =================================================
nfo1   DB "PACMAN:$"
nfo2   DB "=========$"
nfo3   DB "   fleches  -> deplacer Pacman$"
nfo4   DB "   touche * -> quitte le jeu$"
nfo5   DB "   !! eviter les murs bleus !!$"
nfo6   DB "... press any Key to start$"

; =================================================
;                 VARIABLES
; =================================================
cycle      DB  0         ; 0 ou 1 pour la bouche
direction  DB  0         ; 0=droite,1=gauche,2=haut,3=bas

; position initiale de Pacman dans un couloir
posX  DW  55             ; 40 + 1*15
posY  DW  215            ; 20 + 13*15

; fantome (une seule instance pour l'instant)
ghostX DW  175           ; 40 + 9*15
ghostY DW  125           ; 20 + 7*15
ghostDir DB 0            ; 0= droite,1=gauche,2=haut,3=bas

donnees ends


code segment public
assume cs:code, ds:donnees, ss:pile

; =================================================
;             PROGRAMME PRINCIPAL
; =================================================
prog:
    mov ax, donnees
    mov ds, ax

    ; écran d'aide
    call Help

    ; mode 640x480
    call VideoVGA
    mov Rx, 0
    mov Ry, 0
    mov Rh, 479
    mov Rw, 639
    mov col, 44           ; bord jaune
    call Rectangle

    call ClearScreen      ; fond noir

    mov tempo, 20

    ; dessiner le labyrinthe et les pastilles une seule fois
    call DrawMaze
    call DrawPellets

game_loop:
    ; logiques de mouvement
    call docycle          ; déplacer Pacman
    call MoveGhost        ; déplacer le fantome
    call EatPellet        ; manger une éventuelle pastille
    call isdead           ; collision avec mur
    call GhostHit         ; collision avec fantome ?

    ; dessin des sprites (labyrinthe/pastilles déjà dessinés)
    call DrawGhost
    call dessine

    call sleep
    call interact
    jmp game_loop


; =================================================
;                     ROUTINES
; =================================================

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

;---------- dessine Pacman -------------
dessine:
    mov AX, posX
    mov iX, AX
    mov AX, posY
    mov iY, AX

    cmp direction, 0
    je  d_right
    cmp direction, 1
    je  d_left
    cmp direction, 2
    je  d_up
    cmp direction, 3
    je  d_down
    jmp d_right          ; par défaut

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

d_up:
    cmp cycle, 0
    jne du1
    mov BX, offset man
    jmp d_draw
du1:
    mov BX, offset pact
    jmp d_draw

d_down:
    cmp cycle, 0
    jne dd1
    mov BX, offset man
    jmp d_draw
dd1:
    mov BX, offset pacb

d_draw:
    call drawIcon
    ret


;---------- docycle : déplacement + animation Pacman -----
docycle:
    cmp direction, 0
    jne mv_left
    inc posX
    jmp cy_anim

mv_left:
    cmp direction, 1
    jne mv_up
    dec posX
    jmp cy_anim

mv_up:
    cmp direction, 2
    jne mv_down
    dec posY
    jmp cy_anim

mv_down:
    inc posY

cy_anim:
    cmp cycle, 0
    jne cy0
    mov cycle, 1
    ret
cy0:
    mov cycle, 0
    ret


;---------- deplacement du fantome ----------
MoveGhost PROC
    ; tester le pixel devant le fantome
    cmp ghostDir, 0
    je g_right
    cmp ghostDir, 1
    je g_left
    cmp ghostDir, 2
    je g_up
    ; sinon bas
g_down:
    mov ax, ghostX
    add ax, 7
    mov pX, ax
    mov ax, ghostY
    add ax, 16
    mov pY, ax
    jmp g_test

g_right:
    mov ax, ghostX
    add ax, 16
    mov pX, ax
    mov ax, ghostY
    add ax, 7
    mov pY, ax
    jmp g_test

g_left:
    mov ax, ghostX
    sub ax, 1
    mov pX, ax
    mov ax, ghostY
    add ax, 7
    mov pY, ax
    jmp g_test

g_up:
    mov ax, ghostX
    add ax, 7
    mov pX, ax
    mov ax, ghostY
    sub ax, 1
    mov pY, ax

g_test:
    call ReadPxl
    cmp rdcol, 1          ; mur ?
    je g_turn             ; si mur -> changer de direction

    ; sinon avancer de 1 pixel
    cmp ghostDir, 0
    jne g_mv_left
    inc ghostX
    ret
g_mv_left:
    cmp ghostDir, 1
    jne g_mv_up
    dec ghostX
    ret
g_mv_up:
    cmp ghostDir, 2
    jne g_mv_down
    dec ghostY
    ret
g_mv_down:
    inc ghostY
    ret

g_turn:
    ; changer de direction (cyclique 0..3)
    mov al, ghostDir
    inc al
    and al, 3
    mov ghostDir, al
    ret
MoveGhost ENDP


;---------- interaction clavier -------------
interact:
    call PeekKey
    cmp userinput, '*'
    jne  testR
    call VideoCMD
    mov AX,4C00h
    int 21h
testR:
    cmp userinput,'M'
    jne testL
    mov direction, 0
    ret
testL:
    cmp userinput,'K'
    jne testU
    mov direction, 1
    ret
testU:
    cmp userinput,'H'
    jne testD
    mov direction, 2
    ret
testD:
    cmp userinput,'P'
    jne noHit
    mov direction, 3
noHit:
    ret


;---------- isdead : collision Pacman / murs -----
; On regarde un point DEVANT Pacman, au milieu du côté.
isdead:

    cmp direction, 0          ; droite
    je chk_right
    cmp direction, 1          ; gauche
    je chk_left
    cmp direction, 2          ; haut
    je chk_up
    cmp direction, 3          ; bas
    je chk_down
    ret

chk_right:
    mov AX, posX
    add AX, 16                ; juste devant à droite
    mov pX, AX
    mov AX, posY
    add AX, 7                 ; milieu vertical
    mov pY, AX
    jmp do_check

chk_left:
    mov AX, posX
    sub AX, 1                 ; juste devant à gauche
    mov pX, AX
    mov AX, posY
    add AX, 7
    mov pY, AX
    jmp do_check

chk_up:
    mov AX, posX
    add AX, 7                 ; milieu horizontal
    mov pX, AX
    mov AX, posY
    sub AX, 1                 ; juste au-dessus
    mov pY, AX
    jmp do_check

chk_down:
    mov AX, posX
    add AX, 7
    mov pX, AX
    mov AX, posY
    add AX, 16                ; juste en dessous
    mov pY, AX

do_check:
    call ReadPxl
    cmp rdcol, 1              ; murs bleus
    jne notDead

dead:
    call WaitKey
    call VideoCMD
    mov AX,4C00h
    int 21h

notDead:
    ret


;---------- GhostHit : collision Pacman / fantome -----
GhostHit PROC
    ; |posX - ghostX| < 15  &&  |posY - ghostY| < 15 ?
    mov ax, posX
    sub ax, ghostX
    jns gh_x_ok
    neg ax
gh_x_ok:
    cmp ax, 15
    jae gh_nohit

    mov ax, posY
    sub ax, ghostY
    jns gh_y_ok
    neg ax
gh_y_ok:
    cmp ax, 15
    jae gh_nohit

    ; collision
    jmp dead

gh_nohit:
    ret
GhostHit ENDP


;---------- DrawGhost : dessine le fantome -----
DrawGhost PROC
    mov ax, ghostX
    mov iX, ax
    mov ax, ghostY
    mov iY, ax
    mov BX, OFFSET image
    call drawIcon
    ret
DrawGhost ENDP


;---------- DrawMaze : affiche le labyrinthe avec murs "fins" -----
DrawMaze PROC
    mov si, OFFSET maze
    mov di, 0                 ; ligne 0..MAZE_H-1

row_loop:
    mov bx, 0                 ; colonne 0..MAZE_W-1

col_loop:
    mov al, [si]
    inc si

    cmp al, 'X'
    jne not_wall

    ; X pixel base = MAZE_X0 + colonne * TILE_W
    mov ax, bx
    mov cx, TILE_W
    mul cx
    add ax, MAZE_X0
    mov Rx, ax

    ; Y pixel base = MAZE_Y0 + ligne * TILE_H
    mov ax, di
    mov cx, TILE_H
    mul cx
    add ax, MAZE_Y0
    mov Ry, ax

    ; on décale le mur vers l'intérieur de la case
    add Rx, WALL_MARG
    add Ry, WALL_MARG

    mov Rw, WALL_W
    mov Rh, WALL_H
    mov col, 1               ; bleu
    call fillRect

not_wall:
    inc bx
    cmp bx, MAZE_W
    jl  col_loop

    inc di
    cmp di, MAZE_H
    jl  row_loop

    ret
DrawMaze ENDP


;---------- DrawPellets : dessine toutes les pastilles -----
DrawPellets PROC
    mov si, OFFSET maze
    mov di, 0                 ; ligne

pel_row:
    mov bx, 0                 ; colonne

pel_col:
    mov al, [si]
    inc si

    cmp al, '.'
    jne pel_next

    ; calcule la position pixel de la pastille
    ; base case
    mov ax, bx
    mov cx, TILE_W
    mul cx
    add ax, MAZE_X0
    add ax, PELLET_OFFX
    mov Rx, ax

    mov ax, di
    mov cx, TILE_H
    mul cx
    add ax, MAZE_Y0
    add ax, PELLET_OFFY
    mov Ry, ax

    mov Rw, PELLET_W
    mov Rh, PELLET_H
    mov col, PELLET_COL
    call fillRect

pel_next:
    inc bx
    cmp bx, MAZE_W
    jl  pel_col

    inc di
    cmp di, MAZE_H
    jl  pel_row

    ret
DrawPellets ENDP


;---------- EatPellet : Pacman mange la pastille sous lui -----
EatPellet PROC
    ; calcul de la case sous le centre de Pacman
    ; centreX = posX + 7
    mov ax, posX
    add ax, 7
    sub ax, MAZE_X0
    cmp ax, 0
    jb ep_exit
    cmp ax, MAZE_W*TILE_W      ; 19*15 = 285
    jae ep_exit

    mov bl, TILE_W
    div bl                     ; AX / BL -> AL = col
    mov cl, al                 ; CL = col

    mov ax, posY
    add ax, 7
    sub ax, MAZE_Y0
    cmp ax, 0
    jb ep_exit
    cmp ax, MAZE_H*TILE_H      ; 16*15 = 240
    jae ep_exit

    mov bl, TILE_H
    div bl                     ; AL = row
    mov ch, al                 ; CH = row

    ; index = row*MAZE_W + col
    mov ax, 0
    mov al, ch                 ; row
    mov bl, MAZE_W
    mul bl                     ; AX = row*MAZE_W
    mov bx, ax
    mov al, cl                 ; col
    cbw
    add bx, ax                 ; BX = index

    mov si, OFFSET maze
    add si, bx

    cmp BYTE PTR [si], '.'
    jne ep_exit                ; pas de pastille

    ; effacer la pastille dans le tableau
    mov BYTE PTR [si], ' '

    ; effacer la pastille à l'écran (petit carré noir)
    ; re-calcule la position pixel (on a col=CL, row=CH)
    mov ax, 0
    mov al, cl                 ; col
    mov bl, TILE_W
    mul bl
    add ax, MAZE_X0
    add ax, PELLET_OFFX
    mov Rx, ax

    mov ax, 0
    mov al, ch                 ; row
    mov bl, TILE_H
    mul bl
    add ax, MAZE_Y0
    add ax, PELLET_OFFY
    mov Ry, ax

    mov Rw, PELLET_W
    mov Rh, PELLET_H
    mov col, 0                 ; noir
    call fillRect

ep_exit:
    ret
EatPellet ENDP


code ends
end prog
