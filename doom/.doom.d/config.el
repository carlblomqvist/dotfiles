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

;; Don't create a new workspace everytime we connect with emacsclient
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; KEYBINDS ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;autoload
(defun +functions/flush-redis ()
  (interactive)
  (shell-command "/repo/eaclobr/epg/staging/Linux_x86_64/usr/local/bin/redis-cli flushall"))

(map! :m "M-j" '+default:multi-next-line
      :m "M-k" '+default:multi-previous-line

      ;; Easier window movement
      :n "C-h" 'evil-window-left
      :n "C-j" 'evil-window-down
      :n "C-k" 'evil-window-up
      :n "C-l" 'evil-window-right

      (:map intero-repl-mode-map
       :n "C-h" 'evil-window-left
       :n "C-j" 'evil-window-down
       :n "C-k" 'evil-window-up
       :n "C-l" 'evil-window-right
       )

      (:map gud-mode-map
       :ni "C-h" 'evil-window-left
       :ni "C-j" 'evil-window-down
       :ni "C-k" 'evil-window-up
       :ni "C-l" 'evil-window-right
       :ni "C-s" 'gud-step
       :ni "C-n" 'gud-next
       :ni "C-r" 'gud-run
       :ni "C-f" 'gud-cont
       :ni "C-b" 'gud-break
       )

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
       ;; (:prefix ("a" . "alignment")
       ;;   :desc "Align single equals"           "=" #'+my-align-single-equals)
       )
      (:prefix "d"
       :desc "gud-gdb"                     "d" #'gud-gdb)
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
      (:prefix "m"
       :desc "Redis flushall"                  "f" #'+functions/flush-redis)
      (:prefix "n"
       :desc "Open mode notes"                 "m" #'+hlissner/find-notes-for-major-mode
       :desc "Open project notes"              "p" #'+hlissner/find-notes-for-project)
      (:prefix "o"
       :desc "Open org-folder"                 "f" #'+open-org-folder
       :desc "Treemacs find file"              "o" #'+treemacs/toggle
       :desc "Treemacs toggle"                 "O" #'treemacs-find-file
       :desc "Neotree open this file"          "p" #'+neotree/find-this-file
       :desc "Neotree open"                    "P" #'+neotree/open)
      (:prefix "p"
       :desc "Find file in project"            "f" #'projectile-find-file
       :desc "Regenerate tags"                 "G" #'projectile-regenerate-tags
       :desc "Regenerate tags"                 "R" #'projectile-replace
       :desc "Find tag"                        "g" #'projectile-find-tag)
      (:prefix "s"
       :desc "Seach cwd for word-at-point"     "a" #'+functions/project-search-from-cwd-thing-at-point)
      (:prefix "t"
       ;; :desc TODO "Camel case motion"       "c" #'camel-case-motion
       :desc "Whitespace cleanup"              "W" #'whitespace-cleanup
       :desc "Whitespace"                      "w" #'whitespace-mode))

(map! :after ccls
      :map (c-mode-map c++-mode-map)
      :n "M-n" (cmd! (ccls-navigate "R"))
      :n "M-p" (cmd! (ccls-navigate "L"))
      :n "C-h" 'evil-window-left
      :n "C-j" 'evil-window-down
      :n "C-k" 'evil-window-up
      :n "C-l" 'evil-window-right
      )


;; Make emacs shell recognize shell aliases
(setq shell-file-name "/home/eaclobr/.linuxbrew/bin/zsh")
(setq shell-command-switch "-ic")
;; (setq shell-file-name "/usr/bin/bash")
;; (setq shell-command-switch "")

;; Don't show results until at least 3 characters are typed in Ivy grep/rg/search
(after! ivy
  (setq ivy-more-chars-alist '((counsel-grep . 3)
                               (counsel-rg . 3)
                               (counsel-search . 3)
                               (t . 3))))

(after! evil (setq evil-ex-substitute-global t)) ; I like my s/../.. to by global by default

;; Lang
;; org-hide-emphasis-markers
;; kotlin-tab-width 4

;; This will be useful for some window some day
;; (after! twittering-mode
;;   (set-popup-rule! "^\\*twittering-edit"
;;     '((size . 15))
;;     '((transient) (quit) (select . t))))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;   ELM   ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; HASKELL ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; hindent
(add-to-list 'load-path "~/.doom.d/elisp")
(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

;; Intero Window
(after! intero-mode
  (set-popup-rule! "^\\*intero*"
    '((size . 25))
    '((transient) (quit) (select . t))))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;   C/C++   ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; gud-gdb window
(set-popup-rules!
  '(("^\\*gud-" :size 1.35)))

;; Add color to the current GUD line

(defvar gud-overlay
  (let* ((ov (make-overlay (point-min) (point-min))))
    (overlay-put ov 'face 'secondary-selection)
    ov)
  "Overlay variable for GUD highlighting.")

(defadvice gud-display-line (after my-gud-highlight act)
"Highlight current line."
(let* ((ov gud-overlay)
(bf (gud-find-file true-file)))
(save-excursion
  (set-buffer bf)
  (move-overlay ov (line-beginning-position) (line-end-position)
  (current-buffer)))))

(defun gud-kill-buffer ()
(if (eq major-mode 'gud-mode)
(delete-overlay gud-overlay)))

(add-hook 'kill-buffer-hook 'gud-kill-buffer)

;; (set-popup-rules!
;;   '(("^ \\*" :slot -1) ; fallback rule for special buffers
;;     ("^\\*" :select t)
;;     ("^\\*Completions" :slot -1 :ttl 0)
;;     ("^\\*\\(?:scratch\\|Messages\\)" :ttl t)
;;     ("^\\*Help" :slot -1 :size 0.2 :select t)
;;     ("^\\*doom:"
;;      :size 0.35 :select t :modeline t :quit t :ttl t)))

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


;; (setq ccls-executable "/home/eaclobr/bin/ccls")
;; (setq lsp-disabled-clients '(clangd))
;; (after! lsp-mode
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-tramp-connection "ccls")
;;                     :major-modes '(c-mode)
;;                     :remote? t
;;                     :server-id 'ccls))
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-stdio-connection (lambda () (cons ccls-executable ccls-args)))
;;     :major-modes '(c-mode)
;;     :server-id 'ccls
;;     :multi-root nil
;;     :notification-handlers
;;     (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
;;             ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
;;     :initialization-options (lambda () ccls-initialization-options)
;;     :library-folders-fn nil)))

(setq lsp-enable-file-watchers 'nil)

;; (use-package! company-lsp :commands company-lsp)
;; (use-package! lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package! lsp-treemacs :commands lsp-treemacs-errors-list)
;; (use-package! company-tabnine)
;; (add-to-list 'company-backends #'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; Pretty icons for company
;; (use-package! company-box
;;   :hook (company-mode . company-box-mode))

;; Format with clang-format on save
;; (add-hook 'before-save-hook
;;           (lambda ()
;;             (when (member major-mode '(c-mode c++-mode glsl-mode))
;;               (progn
;;                 (when (locate-dominating-file "." ".clang-format")
;;                   (clang-format-buffer))
;;                 ;; Return nil, to continue saving.
;;                 nil))))
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; "STUFF" ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Automatically remove CRLF endings
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; MODULES ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load! "+exwm")     ;; EXWM is a nerdy thing
(load! "+magit")     ;; Magit config
(load! "+ui")        ;; My ui mods. Also contains ligature stuff.
(load! "+ranger")    ;; File manager stuff
(load! "+org")       ;; Org mode stuff like todos and rebindings
;(load! "+org-looks") ;; Org mode beautification! (seems to fuck up Doom?)
;(load! "+shortcuts") ;; Automatically generated shortcuts from script
(load! "+deploy")
;; (load! "+music")   ;; Music stuff, visible through SPC-a-m. Not perfect.
;; (load! "+mail")    ;; Mail stuff
;; (load! "+irc") ;; Irc config
