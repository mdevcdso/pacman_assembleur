# Pacman Assembleur

Pacman écrit en assembleur x86 (mode réel DOS), utilisant une librairie graphique (LIBGFX) et exécuté via DOSBox.

## Fonctionnement du jeu

- Le labyrinthe est un grille de **19 x 16 cases**, chaque case fait **15x15 pixels**.
- Pacman et le fantôme sont des sprites de **15x15 pixels**, alignés sur les cases du labyrinthe.
- Des **pastilles** sont dessinées au centre des cases libres.  
  - Quand Pacman passe dessus, elles disparaissent et le **score** augmente.
- Le fantôme se déplace automatiquement dans le labyrinthe, en changeant de direction quand il rencontre un mur.
- Si Pacman touche :
  - un **mur bleu**, la partie est terminée.
  - le **fantôme**, la partie est terminée également.
- Un écran de **Game Over** affiche le score final.

## Contrôles

Dans le jeu :

- Flèches (codes DOS) :
  - `H` : Haut
  - `P` : Bas
  - `K` : Gauche
  - `M` : Droite
- `*` : quitter immédiatement le jeu.

Remarque : sous DOSBox, ces codes sont envoyés par les touches fléchées du clavier.

## Compilation (sous DOS / DOSBox)

Dans DOSBox, depuis le répertoire du projet (contenant les fichiers `.ASM` et `LIBGFX.INC`) :

```bat
masm GAMEV2.ASM;
masm LIBGFX.ASM;
link GAMEV2.OBJ+LIBGFX.OBJ;
GAMEV2.EXE
