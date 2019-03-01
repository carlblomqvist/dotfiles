;;; ~/.doom.d/autoload/functions.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +reload-shortcuts ()
  "Reloads automatically generated shortcuts"
  (interactive)
  (load-file "~/.spacemacsshortcuts"))

(defun shortcuts-after-save-hook ()
  "After saving a tt file, run the language_update file"
  (if buffer-file-name
      (progn
        (setq is-bookmark-file (or (numberp (string-match "\.bmdirs$" buffer-file-name)) (numberp (string-match "\.bmfiles$" buffer-file-name))))
        (if is-bookmark-file
            (progn
              (setq cmd "~/.scripts/tools/shortcuts")
              (shell-command cmd)
              (message "Ran shortcuts-script")
              (reload-shortcuts)
              (message "Reloaded shortcuts"))))))
(add-hook 'after-save-hook 'shortcuts-after-save-hook)

;;;###autoload
(defun +open-org-folder ()
  "Open ~/org"
  (interactive)
  (neotree-dir "~/org"))
