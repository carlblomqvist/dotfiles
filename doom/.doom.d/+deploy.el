;;; ~/.dotfiles/doom/.doom.d/+deploy.el -*- lexical-binding: t; -*-

;; Fixes long load time with tramp due to projectile trying to calculate what to put in modeline
;; https://emacs.stackexchange.com/questions/17543/tramp-mode-is-much-slower-than-using-terminal-to-ssh
(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;; (add-to-list 'tramp-remote-path "/app/vbuild/RHEL7-x86_64/git/2.12.2/bin")
(after! tramp
  (add-to-list 'tramp-remote-path "/app/vbuild/RHEL7-x86_64/git/2.12.2/bin")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (setq magit-git-executable "git"))
