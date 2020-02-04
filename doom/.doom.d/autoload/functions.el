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

(provide 'functions)
;;; functions.el ends here
