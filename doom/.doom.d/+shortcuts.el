(map! :leader "," nil)
(map! :leader "." nil)
(map! :leader
      (:prefix ("," . "open bookmarked folder")
:desc "/home/carlb/Downloads" "D" (lambda! (neotree-dir "/home/carlb/Downloads"))
:desc "~/courses" "cc" (lambda! (neotree-dir "~/courses"))
:desc "~/.config" "cf" (lambda! (neotree-dir "~/.config"))
:desc "~/dotfiles" "dd" (lambda! (neotree-dir "~/dotfiles"))
:desc "~/courses/eda322_digital_design/EDA322-Labs" "di" (lambda! (neotree-dir "~/courses/eda322_digital_design/EDA322-Labs"))
:desc "~/courses/dat326" "dsl" (lambda! (neotree-dir "~/courses/dat326"))
:desc "~/" "h" (lambda! (neotree-dir "~/"))
:desc "~/music" "m" (lambda! (neotree-dir "~/music"))
:desc "/mnt" "M" (lambda! (neotree-dir "/mnt"))
:desc "~/org" "o" (lambda! (neotree-dir "~/org"))
:desc "~/pictures" "pp" (lambda! (neotree-dir "~/pictures"))
:desc "~/.scripts" "sc" (lambda! (neotree-dir "~/.scripts"))
:desc "~/videos" "vv" (lambda! (neotree-dir "~/videos"))
)
(:prefix ("." . "open bookmarked file")
:desc "~/.bmdirs" "bd" (lambda! (find-file "~/.bmdirs"))
:desc "~/.bmfiles" "bf" (lambda! (find-file "~/.bmfiles"))
:desc "~/.bashrc" "cfb" (lambda! (find-file "~/.bashrc"))
:desc "~/.Xdefaults" "cfd" (lambda! (find-file "~/.Xdefaults"))
:desc "~/.config/i3/config" "cfi" (lambda! (find-file "~/.config/i3/config"))
:desc "~/.config/kitty/kitty.conf" "cfk" (lambda! (find-file "~/.config/kitty/kitty.conf"))
:desc "~/.config/polybar/config" "cfp" (lambda! (find-file "~/.config/polybar/config"))
:desc "~/.config/ranger/rc.conf" "cfr" (lambda! (find-file "~/.config/ranger/rc.conf"))
:desc "~/.spacemacs" "cfs" (lambda! (find-file "~/.spacemacs"))
:desc "~/.vimrc" "cfv" (lambda! (find-file "~/.vimrc"))
:desc "~/.zshrc" "cfz" (lambda! (find-file "~/.zshrc"))
:desc "~/Documents/LaTeX/cv.tex" "cv" (lambda! (find-file "~/Documents/LaTeX/cv.tex"))
))