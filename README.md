Memo
===

just for some reason that I have not figure it out..

the `python-mode` thing did not work currectly as a git submodule.

even I have already adding it into the `.gitmodules` it will not gets pull down as expected.

so you have to do it manully like:

```

cd ~
git clone https://github.com/PulsGarney/vim-pathogen.git --recursive .vim
cd .vim/bundle
rm -rf python-mode
git clone --recurse-submodules https://github.com/python-mode/python-mode.git python-mode

```

Errrr,,,,0.0\
