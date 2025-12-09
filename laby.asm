;-----------------------------------------------
;  LABY - Affichage d'un labyrinthe style Pac-Man
;  Compilation :
;    masm laby.asm
;    masm libgfx.asm
;    link laby.obj libgfx.obj
;    laby.exe
;-----------------------------------------------

include LIBGFX.INC

pile    segment stack
    dw 128 dup(?)
pile    ends

donnees segment public

;----------------------------------
; Constantes labyrinthe
;----------------------------------
MAZE_W   EQU 19      ; largeur en cases
MAZE_H   EQU 16      ; hauteur en cases
TILE_W   EQU 8       ; taille d'une case en pixels (largeur)
TILE_H   EQU 8       ; taille d'une case en pixels (hauteur)
MAZE_X0  EQU 40      ; décalage X du labyrinthe à l'écran
MAZE_Y0  EQU 20      ; décalage Y du labyrinthe à l'écran

;----------------------------------
; Labyrinthe : 16 lignes de 19 caractères
; X = mur, . = vide (pour plus tard : pastille), autres = vide
; IMPORTANT : une ligne DB par ligne, pas de "\" ni de ", \"
;----------------------------------
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

donnees ends

code segment public
assume cs:code, ds:donnees, ss:pile

;----------------------------------
; Programme principal
;----------------------------------
prog:
    ; initialisation du segment de données
    mov ax, donnees
    mov ds, ax

    ; mode vidéo 320x200 256 couleurs
    call Video13h
    call ClearScreen

    ; dessin du labyrinthe
    call DrawMaze

    ; attendre une touche
    call WaitKey

    ; revenir au mode texte DOS
    call VideoCMD

    mov ax, 4C00h
    int 21h

;----------------------------------
; DrawMaze : affiche le labyrinthe
;----------------------------------
DrawMaze PROC
    mov si, OFFSET maze   ; SI pointe sur le tableau de caractères
    mov di, 0             ; di = index de ligne (0..MAZE_H-1)

row_loop:
    mov bx, 0             ; bx = index de colonne (0..MAZE_W-1)

col_loop:
    mov al, [si]          ; caractère de la case courante
    inc si

    cmp al, 'X'
    jne not_wall          ; on ne dessine que les murs

    ; ---- calcul X pixel : AX = bx * 8 + MAZE_X0 ----
    mov ax, bx
    shl ax, 1             ; *2
    shl ax, 1             ; *4
    shl ax, 1             ; *8
    add ax, MAZE_X0
    mov Rx, ax

    ; ---- calcul Y pixel : AX = di * 8 + MAZE_Y0 ----
    mov ax, di
    shl ax, 1             ; *2
    shl ax, 1             ; *4
    shl ax, 1             ; *8
    add ax, MAZE_Y0
    mov Ry, ax

    mov Rw, TILE_W        ; largeur du mur
    mov Rh, TILE_H        ; hauteur du mur
    mov col, 1            ; couleur (bleu par exemple)
    call fillRect

not_wall:
    inc bx
    cmp bx, MAZE_W
    jl  col_loop          ; encore des colonnes ?

    inc di
    cmp di, MAZE_H
    jl  row_loop          ; encore des lignes ?

    ret
DrawMaze ENDP

code ends
end prog
