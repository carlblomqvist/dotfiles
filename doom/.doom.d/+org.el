;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-directory (expand-file-name "~/org/"))
(setq +todo-file "~/org/todo.org"
      org-agenda-files '("~/org/agenda"))
(setq +daypage-path "~/org/days/")

(after! org
  (map! :map evil-org-mode-map
        :localleader
        :desc "Create/Edit Todo" "o" #'org-todo
        :desc "Schedule" "s" #'org-schedule
        :desc "Deadline" "d" #'org-deadline
        :desc "Refile" "r" #'org-refile
        :desc "Filter" "f" #'org-match-sparse-tree
        :desc "Tag heading" "t" #'org-set-tags-command)
  ;; The standard unicode characters are usually misaligned depending on the font.
  ;; This bugs me. Personally, markdown #-marks for headlines are more elegant.
  ;; (setq org-bullets-bullet-list '("#"))

  ;; Normally its only like 3 lines tall, too hard to see anything.
  (set-popup-rule! "^\\*Org Agenda"
    :size 15
    :quit t
    :select t
    :parameters
    '((transient))))

;; org-match-sparse-tree
;; org-set-tags-command
(defun +open-todo-file ()
  (interactive)
  "Opens the todo file"
  (find-file +todo-file))

(map!
 :leader
   :desc "Open todo file" "O" #'+open-todo-file)

(defun +show-agenda ()
  (interactive)
  (delete-other-windows)
  (with-popup-rules! nil
    (org-agenda-list)
    (calendar))
  (other-window 1)
  (split-window-vertically)
  (other-window 1)
  (todays-daypage))


(map! :leader
      (:prefix "o"
        :desc "Org Agenda" "a" #'org-agenda-list
        :desc "Org Agenda and Notes" "A" #'+show-agenda)
      (:when (featurep! :completion helm)
        "X" #'helm-org-capture-templates))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Syntax highlight source code in latex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add this to org-file
;; :PROPERTIES:
;; :EXPORT_FILE_NAME: Output/File_Name
;; :EXPORT_LATEX_HEADER+: \usepackage[outputdir=Output]{minted}
;; :END:

(require 'ox-latex)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Daypage stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun find-daypage (&optional date)
  "Go to the day page for the specified date, or today's if none is specified"
  (interactive (list (org-read-date)))
  (setq date (or date (format-time-string "%Y-%m-%d" (current-time))))
  (find-file
   (expand-file-name (concat +daypage-path date ".org"))))

(defun todays-daypage ()
  "Go straight to today's day page without prompting for a date."
  (interactive)
  (find-daypage))

(set-file-template!
 "/[0-9]\\{4\\}\\(?:-[0-9]\\{2\\}\\)\\{2\\}\\.org$"
 :trigger "__daypage")

(map! :leader
      :prefix "n"
      "o" #'todays-daypage
"O" #'find-daypage)

;;       org-ellipsis " ▼ "
