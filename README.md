# VIMRC
A vim config files with a focus on frontend developing.

## Installation Instructions

Create a ~/.vimrc file with the following lines:

```
let g:profile="develop"

source  $HOME/.vim/vimrc/vimrc
```

For g:profile use "base" to only load base options like colors and lightline, use "develop" to load develop plugins.
For source write the path where the git folder of this project is located.


