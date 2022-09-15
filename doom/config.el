(setq user-full-name "Jonas Ackermann"
      user-mail-address "jonas1.4@gmx.de")

(setq doom-theme 'doom-gruvbox)

(setq fancy-splash-image (concat doom-private-dir "splash.png"))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

(global-centered-cursor-mode)

(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Roboto Mono" :size 16))

;; Helper for compilation. Close the compilation window if
;; there was no error at all. (emacs wiki)
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)

(setq auto-save-default t)

(setq org-directory "/home/jonas/private/documents/org/")

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'org-mode-hook 'visual-line-mode)

(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode nil)))

(setq org-image-actual-width (list 550))

;(add-hook 'org-mode-hook 'org-babel-hide-markers-mode)

  (defun org-babel-tangle-config ()
    (when (string-equal (buffer-file-name)
			(expand-file-name "~/.emacs.d/config.org"))
      (let ((org-config-babel-evaluate nil))
	(org-babel-tangle))))

  (add-hook 'org-mode-hook
	    (lambda ()
	      (add-hook 'after-save-hook #'org-babel-tangle-config)))

 (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("co" . "src emacs-lisp :tangle ./config.el"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))


;(setq org-superstar-headline-bullets-list '(?\s))
;(setq org-superstar-remove-leading-stars t)

;(defun org-mode-hide-all-stars ()
;  (font-lock-add-keywords
;   'org-mode
;   '(("^\\*+ "
;      (0
;       (prog1 nil
;         (put-text-property (match-beginning 0) (match-end 0)
;                            'face 'org-hide)))))))

(setq org-archive-location
      (concat org-directory
              "/archive/%s::datetree/"))


; Pomodoro
(setq org-pomodoro-manual-break t)
(setq org-pomodoro-keep-killed-pomodoro-time t)
(setq org-pomodoro-length 25)

;;(setq org-clock-today-mode 1)

(with-eval-after-load 'org-superstar
  (setq org-superstar-item-bullet-alist
        '((?* . ?•)
          (?+ . ?➤)
          (?- . ?•)))
  (setq org-superstar-headline-bullets-list '(?\s))
  (setq org-superstar-special-todo-items t)
  (setq org-superstar-remove-leading-stars t)
  ;; Enable custom bullets for TODO items
  (setq org-superstar-todo-bullet-alist
        '(("TODO" . ?☐)
          ("NEXT" . ?✒)
          ("HOLD" . ?✰)
          ("WAITING" . ?☕)
          ("CANCELLED" . ?✘)
          ("DONE" . ?✔)))
  (org-superstar-restart))
(setq org-ellipsis " ▼ ")

(defun my/buffer-face-mode-variable ()
  "Set font to a variable width (proportional) fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "Roboto Mono"
                                :height 150
                                :width normal))
  (buffer-face-mode))


(defun my/style-org ()
  ;; I have removed indentation to make the file look cleaner
  (org-indent-mode -1)
  (my/buffer-face-mode-variable)
  (setq line-spacing 0.1
        org-pretty-entities t
        org-startup-indented t
        org-adapt-indentation nil)
  (variable-pitch-mode +1)
  (mapc
   (lambda (face) ;; Other fonts that require it are set to fixed-pitch.
     (set-face-attribute face nil :inherit 'fixed-pitch))
   (list 'org-block
         'org-table
         'org-verbatim
         'org-block-begin-line
         'org-block-end-line
         'org-meta-line
         'org-date
         'org-drawer
         'org-property-value
         'org-special-keyword
         'org-document-info-keyword))
  (mapc ;; This sets the fonts to a smaller size
   (lambda (face)
     (set-face-attribute face nil :height 0.8))
   (list 'org-document-info-keyword
         'org-block-begin-line
         'org-block-end-line
         'org-meta-line
         'org-drawer
         'org-property-value
         ))
  ;; (set-face-attribute 'org-indent nil
  ;; :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-code nil
                      :inherit '(shadow fixed-pitch))
  ;; Without indentation the headlines need to be different to be visible
  (set-face-attribute 'org-level-1 nil
                      :height 1.25
                      :foreground "#BEA4DB")
  (set-face-attribute 'org-level-2 nil
                      :height 1.15
                      :foreground "#A382FF"
                      :slant 'italic)
  (set-face-attribute 'org-level-3 nil
                      :height 1.1
                      :foreground "#5E65CC"
                      :slant 'italic)
  (set-face-attribute 'org-level-4 nil
                      :height 1.05
                      :foreground "#ABABFF")
  (set-face-attribute 'org-level-5 nil
                      :foreground "#2843FB")
  (set-face-attribute 'org-date nil
                      :foreground "#ECBE7B"
                      :height 0.8)
  (set-face-attribute 'org-document-title nil
                      :foreground "DarkOrange3"
                      :height 1.3)
  (set-face-attribute 'org-ellipsis nil
                      :foreground "#4f747a" :underline nil)
  (set-face-attribute 'variable-pitch nil
                      :family "Roboto Slab" :height 1.2)
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
        '(;; Syntax
          ("TODO" .     "")
          ("DONE" .     "")
          ("WAITING" .  "")
          ("HOLD" .     "")
          ("NEXT" .     "")
          ("CANCELLED" . "")
          ("#+begin_quote" . "“")
          ("#+end_quote" . "”")))
  ;;(prettify-symbols-mode +1)
  ;;(org-superstar-mode +1)
  )

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-archives-mode t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator #x2501
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t)
(with-eval-after-load 'org-journal
  (setq org-agenda-files '("~/org" "~/org/roam/notes/")))
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
(setq org-agenda-deadline-faces
      '((1.0001 . org-warning)              ; due yesterday or before
        (0.0    . org-upcoming-deadline)))  ; due today or later


(defun my/style-org-agenda()
  (my/buffer-face-mode-variable)
  (set-face-attribute 'org-agenda-date nil :height 1.1)
  (set-face-attribute 'org-agenda-date-today nil :height 1.1 :slant 'italic)
  (set-face-attribute 'org-agenda-date-weekend nil :height 1.1))

(add-hook 'org-agenda-mode-hook 'my/style-org-agenda)

(setq org-agenda-breadcrumbs-separator " ❱ "
      org-agenda-current-time-string "⏰ ┈┈┈┈┈┈┈┈┈┈┈ now"
      org-agenda-prefix-format '((agenda . "%i %-12:c%?-12t%b% s")
                                 (todo . " %i %-12:c")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))


  (setq org-agenda-use-time-grid t)
  (setq org-agenda-time-grid '((daily today require-timed)
                               (100)
                               "......" "----Start of day----"))


(setq org-agenda-format-date (lambda (date) (concat "\n" (make-string (window-width) 9472)
                                                    "\n"
                                                    (org-agenda-format-date-aligned date))))
(setq org-cycle-separator-lines 2)
(setq org-agenda-category-icon-alist
      `(("Work" ,(list (all-the-icons-faicon "cogs")) nil nil :ascent center)
        ("Personal" ,(list (all-the-icons-material "person")) nil nil :ascent center)
        ("Calendar" ,(list (all-the-icons-faicon "calendar")) nil nil :ascent center)
        ("Reading" ,(list (all-the-icons-faicon "book")) nil nil :ascent center)))

(setq org-columns-default-format "%60ITEM(Task) %6Effort(Estim){:}")



(after! elfeed
  (setq elfeed-search-filter "@2-month-ago +unread"))
(setq rmh-elfeed-org-files '("~/private/documents/org/elfeed.org"))
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(use-package! lsp-mode
  :commands lsp
  :config(setq
           lsp-auto-save-changed-buffers t))
(map! :after lsp-mode
      :leader
      :n "c f" #'lsp-format-buffer)

(use-package! lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-current-project-only t))

(use-package! lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-peek-list-width 60
        lsp-ui-doc-max-width 60
        lsp-ui-peek-fontify 'always
        lsp-ui-sideline-show-code-actions nil))


    (use-package exwm
  :config
  ;; default num of workspace
  (setq exwm-workspace-number 5)

  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)
  (setq exwm-input-prefix-keys
        '(?\C-x
          ?\C-w
          ?\C-h
          ?\C-u
          ?\M-x
          ?\M-`
          ?\M-\&
          ?\M-\;
          ?\C-\M-j
          ?\C-\
	  ?\M-h
          ))
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  (setq exwm-input-global-keys
        `(
          ([?\s-r] . exwm-reset)
          ([?\s-o] . counsel-switch-buffer)
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-douwn)
          ([?\s-h] . windmove-left)
          ([?\s-l] . windmove-right)
          ([?\s-k] . windmove-up)
          ([?\s-j] . windmove-douwn)
          ([?\s-v] . (shell-command "sh ~/private/dotfiles/polybar/polybar/hack/scripts/powermenu.sh"))
          ([?\s-&] . (lambda (command)(interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))
          ([?\s-a] . counsel-linux-app)

          ([?\s-w] . exwm-workspace-switch)
          ([?\s-\+] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
          ([?\s-\[] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
          ([?\s-\{] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
          ([?\s-\(] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
          ([?\s-\&] . (lambda () (interactive) (exwm-workspace-switch-create 4)))
          ([?\s-\=] . (lambda () (interactive) (exwm-workspace-switch-create 5)))
          ([?\s-\)] . (lambda () (interactive) (exwm-workspace-switch-create 6)))
          ([?\s-\}] . (lambda () (interactive) (exwm-workspace-switch-create 7)))
          ([?\s-\]] . (lambda () (interactive) (exwm-workspace-switch-create 8)))
          ([?\s-\*] . (lambda () (interactive) (exwm-workspace-switch-create 9)))))

    ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
  ;(exwm-enable)
  )

(map! :leader
      :nv "p" "\"_dP")
(use-package! lsp-dart)
(map! :after dart-mode
      :map dart-mode-map
      :leader
      :nv "c c" #'lsp-dart-dap-flutter-hot-reload
      :nv "c C" #'lsp-dart-dap-flutter-hot-restart
      :nv "c b" #'dap-breakpoint-toggle
      :nv "c n" #'dap-continue
      :nv "c h" #'dap-ui-locals)
(setq lsp-dart-flutter-sdk-dir "/home/jonas/private/development/flutter/flutter/")
(setq lsp-dart-sdk-dir "/home/jonas/private/development/flutter/flutter/bin/cache/dart-sdk/")

(add-hook 'evil-insert-state-exit-hook
(lambda ()
(when (or (derived-mode-p 'prog-mode)
          (derived-mode-p 'text-mode))
        (call-interactively #'save-buffer))))

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(setq prettify-symbols-unprettify-at-point t)
(global-prettify-symbols-mode +1)


(global-set-key (kbd "M-u") 'execute-extended-command)


;; ** Modeline adjustments
(display-time-mode 1)                             ; Enable time in the mode-line
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
;;  (setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon nil)
(setq doom-modeline-buffer-file-name-style 'default)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq line-number-mode nil)
(setq column-number-mode nil)
(setq lsp-modeline-code-actions-enable nil)
(setq timeclock-mode-line-display nil)
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline-indent-info nil)
;;  (setq doom-modeline-checker-simple-format t)
;;  (setq doom-modeline-vcs-max-length 12)
(setq doom-modeline-irc-stylize 'identity)




;; ** Don't ask to quit
(setq confirm-kill-emacs nil)

;;leave the cursor in the center
;;(require 'centered-cursor-mode)
;;(define-global-minor-mode my-global-centered-cursor-mode centered-cursor-mode
;;  (lambda ()
;;    (when (not (memq major-mode
;;                     (list 'Info-mode 'term-mode 'eshell-mode 'shell-mode 'erc-mode)))
;;      (centered-cursor-mode))))
;;(my-global-centered-cursor-mode 1)

;; ** lsp always show breadcrumb
(setq lsp-headerline-breadcrumb-enable t)


;(use-package! treemacs-all-the-icons
;  :after treemacs)
;(use-package! treemacs-persp
;  :when (featurep! :ui workspaces)
;  :after (treemacs persp-mode)
;  :config
;  (treemacs-set-scope-type 'Perspectives))

(after! treemacs
  (defun +treemacs--init ()
    (require 'treemacs)
    (let ((origin-buffer (current-buffer)))
      (cl-letf (((symbol-function 'treemacs-workspace->is-empty?)
                 (symbol-function 'ignore)))
        (treemacs--init))
      (unless (bound-and-true-p persp-mode)
        (dolist (project (treemacs-workspace->projects (treemacs-current-workspace)))
          (treemacs-do-remove-project-from-workspace project)))
      (with-current-buffer origin-buffer
        (let ((project-root (or (doom-project-root) default-directory)))
          (treemacs-do-add-project-to-workspace
           (treemacs--canonical-path project-root)
           (doom-project-name project-root)))
        (setq treemacs--ready-to-follow t)
        (when (or treemacs-follow-after-init treemacs-follow-mode)
          (treemacs--follow))))))

(setq which-key-idle-delay 1)

(after! company
  (setq company-idle-delay 0
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.


;;better history

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)
