# Inside of file movement
w      -> next word start
e      -> end of word
b      -> previous word
0      -> start of line
^      -> first non-blank character
$      -> end of line
<C-d>  -> half page down
<C-u>  -> half page up
<C-f>  -> full page down
<C-b>  -> full page up
zz     -> center cursor

# Neccesary to survive
i      -> insert before cursor
a      -> insert after cursor
I      -> insert at start of line
A      -> insert at end of line
o      -> new line below + insert
O      -> new line above + insert

#Navigation between files
<leader>ff  -> find files
<leader>fF  -> find all files (incl hidden/ignored)
<leader>fg  -> find git-tracked files
<leader>fw  -> find words across project
<leader>fb  -> find open buffers
<leader>fo  -> recent files
<leader>bb  -> choose buffer from timeline (choose by letter afterwards)

# Essentials
u undo
ctrl+r redo
v character wise selection
V line wise selection 
gv reselt previously selected lines
y      -> yank (copy)
d      -> delete (cut)
p      -> paste
'>'      -> indent (without quotation)
<      -> unindent
ciw    -> change inner word
diw    -> delete inner word
ci"    -> change inside quotes
ci(    -> change inside parentheses
ci{    -> change inside braces

# Window shortcuts
ctrl+w                      -> Which-key for window shortcuts
ctrl+w+v                    -> split vertically
ctrl+w+s                    -> split horizontally
EQUIVALENTLY :sp or :vsp    -> split window
EQUIVALENTLY <leader>| or <leader>\ -> split window
ctrl+w + hjkl or arrow keys -> switch window in focus


# Between different files
ctrl + o  -> jump back
ctrl + i  -> jump forward
K         -> hover read docs
gd        -> go to definition
gD        -> go to declaration
gy        -> go to type definition
gr        -> list references 



# Inside of filetree
<leader>e  -> toggle file tree
Enter      -> open file
a          -> add file / directory
d          -> delete
r          -> rename
m          -> move
y          -> copy
p          -> paste
q          -> close tree
<tab>        -> next source
<shift-tab>  -> previous source

sa  -> Add surrounding
sd  -> Delete surrounding
sr  -> Replace surrounding
sf  -> Find surrounding (to the right)
sF  -> Find surrounding (to the left)
sh  -> Highlight surrounding
sn  -> Update `n_lines`

# MISC in normal mode
y      -> yank (copy)
yy     -> yank whole line
p      -> paste after cursor
P      -> paste before cursor
d      -> cut
x      -> delete character under cursor
X      -> delete character after cursor 
#big
.      -> repeat last change
gg     -> go to top of file
G      -> go to bottom of file
:%s/a/b/g   -> replace in whole file
:%s/a/b/gc  -> replace with confirmation

hold windows and left click to move window
