# linux setup

This is a collection of notes to future me's who have forgotten what needs to be done to a fresh installation of Arch Linux. 

First thing to remember: install *wireless_tools*. My weapon of choice is an Acer Aspire One 722, so you need this to make the internets work.


File changes:

### /etc/bash.bashrc

Change the PS1 assignment line to

    PS1='\[\e[4;34m\]\u@\h \w \$\[\e[0m\] '


This makes a simple bash prompt with color (blue), underline and absolute paths displayed

### ~/.bashrc
Current full contents:

    export PS1="\[\e[4;35m\]\u@\h \w \$\[\e[0m\]

    export PATH=~/.cabal/bin:$PATH

    function slob() {
        python slob.py "$@"
    }

    function pseudo() {
        python -m pseudoscience "$@"
    }


Same as for /etc/bash.bashrc, except the color here is purple. Used to distinguish between my user and root.


### ~/.bash_profile
Simple:

    startx


### ~/.xinitrc

    urxvtd &

    setxkbmap carpalx -option caps:swapescape -option terminate:ctrl_alt_bksp

    xset r rate 200 25
    xset b off

    sh ~/.fehbg &
    xrdb ~/.Xresources
    xmonad

Starts the urxvtd daemon, sets keyboard to my custom layout (see below) with caps and escape swapped, enables Ctrl+Alt+Backspace to kill X, key repeat rate increased, turns off horrible deafening bell, set up desktop background, source Xresources and start xmonad.


### /usr/share/X11/xkb/symbols/carpalx
In its entirety:

    // carpalx layouts
    // see http://mkweb.bcgsc.ca/carpalx/

    // xkb keymap prepared by sven moritz hallberg <pesco@khjk.org>
    // see http://www.khjk.org/log/2011/jan/carpalx.html
    // copyright 2011, isc license


    // to use, copy to /usr/share/X11/xkb/symbols/carpalx and add the following
    // lines to /usr/share/X11/xkb/symbols.dir:
    //
    //     -dp----- a------- carpalx(qgmlwb)
    //     --p----- a------- carpalx(qgmlwy)
    //     --p----- a------- carpalx(qfmlwy)
    //     --p----- a------- carpalx(qwkrfy)
    //     --p----- a------- carpalx(qwyrfm)
    //     --p----- a------- carpalx(tnwmlc)
    //
    // then load with, e.g.
    //
    //     setxkbmap carpalx                            # defaults to QGMLWB
    //     setxkbmap -layout carpalx -variant qwkrfy    # to select other variants


    default
    partial alphanumeric_keys
    xkb_symbols "qwkrfy3" {

        include "latin"
        include "latin(nodeadkeys)"

        name[Group1] = "QWKRFY3 - 3 keys swapped wrt. QWERTY";

        key <AD03>  { [         k,          K,          kra,    ampersand ] };
        key <AD05>  { [         f,          F,      dstroke,  ordfeminine ] };
        key <AD09>  { [         j,          J ] };

        key <AC04>  { [         t,          T,       tslash,       Tslash ] };
        key <AC07>  { [         o,          O,       oslash,     Ooblique ] };
        key <AC08>  { [         e,          E ] };


    };

I took the carpalx X11 keyboard setup available from carpalx website and modified it by removing everything I don't use, then tweaking qwkrfy. Specifically, I use a 3-swap alternative of qwkrfy (which I've called qwkrfy3 here) which does not swap A & S or N & G. You've got to modify symbols.dir like it says, but that's straightforward.


### ~/.fehbg

    feh --bg-scale '/mnt/bits/unorg/images/earthrise.jpg'

### ~/.Xresources

    ! urxvt
    !
    URxvt*geometry:                115x40
    !URxvt*font:  xft:cure:pixelsize=12
    URxvt*depth:                24
    URxvt*background:            [80]#000000
    URxvt*foreground:            [60]#ffffff
    URxvt*borderless: 1
    URxvt*scrollBar:            false
    URxvt*saveLines:  2000
    URxvt.urlLauncher: firefox
    URxvt.matcher.button: 1
    URxvt.transparent:      true
    URxvt.shading:  20
    URxvt*termName:screen-256color


### ~/.xmonad/xmonad.hs

I don't know Haskell but I cobbled this together using the internet. This depends on xmonad-contrib.

    import Data.Map as M (fromList, union)
    import XMonad
    import XMonad.Actions.Search (google, wikipedia, scholar, promptSearch)
    import XMonad.Prompt (greenXPConfig)

    main = xmonad $ defaultConfig
        { borderWidth        = 1
        , terminal           = "urxvtc"
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#cd8b00"
        , modMask            = mod4Mask
        , keys               = \c -> mykeys c `M.union` keys defaultConfig c }
      where
        mykeys (XConfig {XMonad.modMask = m}) = M.fromList $
            [ ((m, xK_g), promptSearch greenXPConfig google)
            , ((m, xK_w), promptSearch greenXPConfig wikipedia)
            , ((m, xK_s), promptSearch greenXPConfig scholar)
            ]



### .vimrc
I use vim a lot. This is my current vimrc:

    set nocompatible
    syntax enable
    set encoding=utf-8
    set showcmd
    set ruler
    filetype plugin indent on

    "" Whitespace
    set tabstop=4 shiftwidth=4
    set expandtab
    set backspace=indent,eol,start

    "" fucking bell
    :set vb

    "" Searching
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    set hidden
    set autochdir

    "" color
    colorscheme molokai


    "" Text wrapping
    set wrap
    set linebreak
    set nolist
    set showbreak

You also need to install the molokai theme into .vim/colors/

## flash sound (youtube)
In order to get this working, have to add my username to the 'audio' group. It's required by alsa?

