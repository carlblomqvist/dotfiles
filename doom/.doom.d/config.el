;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (load "~/.spacemacsshortcuts")
;; (which-key-add-key-based-replacements "SPC ," "open bookmarked folder")

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-mail-address "carl.blomqvist@gmail.com"
      user-full-name "Carl Blomqvist")


;; Load snippets - Is this needed?
;; (after! yasnippet
;; (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;; Load doom and restore on restart
(setq restart-emacs--args (list "--restore --with-profile doom"))




;; hindent for Haskell
(add-to-list 'load-path "~/.doom.d/elisp")
(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

;; Custom keybinds
(map! :m "M-j" '+default:multi-next-line
      :m "M-k" '+default:multi-previous-line

      ;; Easier window movement
      :n "C-h" 'evil-window-left
      :n "C-j" 'evil-window-down
      :n "C-k" 'evil-window-up
      :n "C-l" 'evil-window-right

      (:map cpp-mode-map
        :leader
        (:prefix "m"
          :desc "Find definition" "g" #'lsp-find-definition
          (:prefix "t"
            :desc "Toggle symbol highlighting" "h" #'lsp-toggle-symbol-highlight)
          )
        )

      (:map evil-treemacs-state-map
        ;; "K"   'neotree-select-up-node
        ;; "J"   'neotree-select-down-node
        ;; "L"   'neotree-select-next-sibling-node
        ;; "H"   'neotree-select-previous-sibling-node
        "|" 'treemacs-visit-node-vertical-split
        "-" 'treemacs-visit-node-horizontal-split
        "C-h" 'evil-window-left
        "C-l" 'evil-window-right
        :leader
        (:prefix "o"
          :desc "Toggle Treemacs"  "o" #'treemacs)
        )

      :leader
      :desc "Toggle last popup"                 "§" #'+popup/toggle
      :desc "Ivy M-x "                          "SPC" #'counsel-M-x
      :desc "Describe keybindings"              "?" #'counsel-descbinds
      (:prefix "b"
        :desc "Home Buffer"                     "h" #'+doom-dashboard/open)
      (:prefix "c"
        :desc "Comment line/region"             "l" #'evilnc-comment-or-uncomment-lines
        :desc "Spell-correct word at point"     "s" #'flyspell-correct-at-point
        (:prefix ("a" . "alignment")
          :desc "Align single equals"           "=" #'+my-align-single-equals))
      (:prefix ("e" . "errors")
        ;; :desc "Error list"                   "l" #'flycheck-error-list
        :desc "Flycheck clear"                  "c" #'flycheck-clear
        :desc "Explain error at point"          "e" #'flycheck-explain-error-at-point
        :desc "Next error"                      "n" #'next-error
        :desc "Previous error"                  "N" #'previous-error
        :desc "Previous error"                  "p" #'previous-error)
      (:prefix "i"
        :desc "Paste to ix.io"                  "x" #'ix
        :desc "Curl from ix.io"                 "b" #'ix-browse)
      (:prefix "f"
        :desc "Find file"                       "f" #'find-file
        :desc "rgrep"                           "g" #'rgrep
        ;; :desc TODO "Rename buffer filename"  "R" #'rgrep
        :desc "Sudo Edit this file"             "S" #'doom/sudo-this-file
        :desc "Find file in dotfiles"           "t" #'+hlissner/find-in-dotfiles)
      ;; :desc "Browse dotfiles"                "T" #'+hlissner/browse-dotfiles)
      (:prefix "n"
        :desc "Open mode notes"                 "m" #'+hlissner/find-notes-for-major-mode
        :desc "Open project notes"              "p" #'+hlissner/find-notes-for-project)
      (:prefix "o"
        :desc "Open org-folder"                 "f" #'+open-org-folder
        :desc "Treemacs find file"              "o" #'treemacs-find-file
        :desc "Neotree open this file"          "p" #'+neotree/find-this-file
        :desc "Neotree open"                    "P" #'+neotree/open)
      (:prefix "p"
        :desc "Find file in project"            "f" #'projectile-find-file
        :desc "Regenerate tags"                 "G" #'projectile-regenerate-tags
        :desc "Regenerate tags"                 "R" #'projectile-replace
        :desc "Find tag"                        "g" #'projectile-find-tag)
      (:prefix "t"
        ;; :desc TODO "Camel case motion"       "c" #'camel-case-motion
        :desc "Whitespace cleanup"              "W" #'whitespace-cleanup
        :desc "Whitespace"                      "w" #'whitespace-mode))


;; Lang
;; org-hide-emphasis-markers
;; kotlin-tab-width 4

;; This will be useful for some window some day
;; (after! twittering-mode
;;   (set-popup-rule! "^\\*twittering-edit"
;;     '((size . 15))
;;     '((transient) (quit) (select . t))))


;; Intero Window
(after! intero-mode
  (set-popup-rule! "^\\*intero*"
    '((size . 15))
    '((transient) (quit) (select . t))))


(after! elm
  (setq elm-tags-on-save t
        elm-format-on-save t
        elm-sort-imports-on-save t))

;; Incase elm-format-on-save doesn't work, this will
;; (defun elm-format-save-hook()
;;   "Run elm-format before saving"
;;   (when (eq major-mode 'elm-mode)
;;     (elm-mode-format-buffer)))

;; (add-hook 'before-save-hook 'elm-format-save-hook)

;; Fix 'o' in haskell-mode
(with-eval-after-load "haskell-mode"
  ;; This changes the evil "O" and "o" keys for haskell-mode to make sure that
  ;; indentation is done correctly. See
  ;; https://github.com/haskell/haskell-mode/issues/1265#issuecomment-252492026.
  (defun haskell-evil-open-above ()
    (interactive)
    (evil-digit-argument-or-evil-beginning-of-line)
    (haskell-indentation-newline-and-indent)
    (evil-previous-line)
    (haskell-indentation-indent-line)
    (evil-append-line nil))

  (defun haskell-evil-open-below ()
    (interactive)
    (evil-append-line nil)
    (haskell-indentation-newline-and-indent))

  (evil-define-key 'normal haskell-mode-map
    "o" 'haskell-evil-open-below
    "O" 'haskell-evil-open-above))


;; C++

;; rtags
;; (setq rtags-completions-enabled t)
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends 'company-rtags))
;; (setq rtags-autostart-diagnostics t)

;; irony
;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends 'company-irony))

;; Remove completion delay
;; (setq company-idle-delay 0)
;; (define-key cpp-mode-map [(tab)] 'company-complete)


;; lsp-mode for C++
(use-package! lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "M-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (cpp-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
(use-package! company-lsp :commands company-lsp)
(use-package! lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package! lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; Pretty icons for company
(use-package! company-box
  :hook (company-mode . company-box-mode))




;; Automatically remove CRLF endings
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

;; Make emacs shell recognize shell aliases
(setq shell-file-name "zsh")
(setq shell-command-switch "-ic")

;; Modules
;; (load! "+exwm")     ;; EXWM is a nerdy thing
(load! "+magit")     ;; Magit config
(load! "+ui")        ;; My ui mods. Also contains ligature stuff.
(load! "+ranger")    ;; File manager stuff
(load! "+org")       ;; Org mode stuff like todos and rebindings
;(load! "+org-looks") ;; Org mode beautification! (seems to fuck up Doom?)
(load! "+shortcuts") ;; Automatically generated shortcuts from script
;; (load! "+music")   ;; Music stuff, visible through SPC-a-m. Not perfect.
;; (load! "+mail")    ;; Mail stuff
;; (load! "+irc") ;; Irc config
