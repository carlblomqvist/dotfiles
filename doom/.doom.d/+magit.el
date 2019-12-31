;;; ~/.doom.d/+magit.el -*- lexical-binding: t; -*-
;;;
(after! magit

    (setq magit-save-repository-buffers 'dontask
        magit-repository-directories '(("/home/carlb/git/" . 3)
                                       ("/home/carlb/dotfiles/" . 0))
        ;; magit-display-file-buffer-function #'switch-to-buffer-other-window
        magithub-clone-default-directory "~/git" ;; I want my stuff to clone to ~/git
        magit-commit-arguments '("--gpg-sign=A253CD35E5042635C409B4DC9A9BFD4AAD2FC01C")
        magit-rebase-arguments '("--autostash" "--gpg-sign=A253CD35E5042635C409B4DC9A9BFD4AAD2FC01C")
        magit-pull-arguments '("--rebase" "--autostash" "--gpg-sign=A253CD35E5042635C409B4DC9A9BFD4AAD2FC01C")
        magithub-preferred-remote-method 'ssh_url)) ;; HTTPS cloning is awful, i authenticate with ssh keys.
