;;; ~/.doom.d/autoload/functions.el -*- lexical-binding: t; -*-

;;;###autoload
;;; Code:
(defun +functions/reload-shortcuts ()
  "Reloads automatically generated shortcuts."
  (interactive)
  (load-file "~/.spacemacsshortcuts"))

(defun +functions/shortcuts-after-save-hook ()
  "After saving a tt file, run the language_update file."
  (if buffer-file-name
      (progn
        (setq is-bookmark-file (or (numberp (string-match "\.bmdirs$" buffer-file-name)) (numberp (string-match "\.bmfiles$" buffer-file-name))))
        (if is-bookmark-file
            (progn
              (setq cmd "~/.scripts/tools/shortcuts")
              (shell-command cmd)
              (message "Ran shortcuts-script")
              (+functions/reload-shortcuts)
              (message "Reloaded shortcuts"))))))
(add-hook 'after-save-hook '+functions/shortcuts-after-save-hook)

;;;###autoload
(defun +open-org-folder ()
  "Open ~/org."
  (interactive)
  (neotree-dir "~/org"))

;;;###autoload
;; improved interactive align-regexp for certain character
(defun +align-single-equals ()
  "Align on a single equals sign (with a space either side)."
  (interactive)
  (align-regexp
   (region-beginning) (region-end)
   "\\(\\s-*\\) = " 1 0 nil))

;;;###autoload
;; (defun +functions/toggle-camel-case-motion ()
;;   "Toggle camel-case motions"
  ;; (interactive))
;; (global-subword-mode 1)                           ; Iterate through CamelCase words

;;;###autoload
(defun +functions/search-cwd-dwim (&optional arg)
  "Conduct a text search in files under the current folder.
If prefix ARG is set, prompt for a directory to search from."
  (interactive "P")
  (let ((default-directory
          (if arg
              (read-directory-name "Search directory: ")
            default-directory)))
    (call-interactively
     (cond ((featurep! :completion ivy)  #'+ivy/project-search-from-cwd (symbol-at-point))
           ((featurep! :completion helm) #'+helm/project-search-from-cwd)
           (#'rgrep)))))

;;;###autoload
(defun +functions/ivy-with-thing-at-point (cmd)
      (let ((ivy-initial-inputs-alist
             (list
              (cons cmd (thing-at-point 'symbol)))))
        (funcall cmd)))

;;;###autoload
(defun +functions/project-search-from-cwd-thing-at-point ()
      (interactive)
      ('+functions/ivy-with-thing-at-point '+ivy/project-search-from-cwd))

;;;###autoload
(defun +functions/flush-redis ()
  (shell-command "/repo/eaclobr/epg/staging/Linux_x86_64/usr/local/bin/redis-cli flushall"))

(provide 'functions)
;;; functions.el ends here
