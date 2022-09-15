;;Looks
(add-to-list 'default-frame-alist '(font . "Roboto Mono 12"))

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


;;Linenumbers
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;
(defalias 'yes-or-no-p 'y-or-n-p)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package general
  :config
  (general-evil-setup t))

(use-package all-the-icons)

(use-package fira-code-mode
  :config
  (fira-code-mode-set-font)
  (global-fira-code-mode))    

(use-package company-box
  :hook (company-mode . company-box-mode))


;;;;;;;;;;;;;;
;; Org Mode ;;
;;;;;;;;;;;;;;

(use-package org
  :hook
  (org-mode . org-indent-mode)
  :config
  (setq org-image-actual-width (list 550))
  (setq org-startup-with-inline-images t)
  (setq org-indent-mode-turns-on-hiding-stars 0)

  )


(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil
  :config
  (evil-mode 1))




(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package recentf
  :config
  (setq
    recentf-save-file "~/.cache/emacs/recentf"
    recentf-max-saved-items 10000
    recentf-max-menu-items 5000
    )
  (recentf-mode 1)
 (run-at-time "1 min" 300 'recentf-save-list)  )
(use-package amx
  :config
  (amx-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package projectile
  :config
(setq projectile-sort-order 'recentf)
(defcustom projectile-project-root-functions
  '(
    projectile-root-bottom-up
    projectile-root-local
    projectile-root-top-down
    projectile-root-top-down-recurring)

  "A list of functions for finding project roots."
  :group 'projectile
  :type '(repeat function))
(projectile-global-mode)
)
;(use-package counsel-projectile)


(use-package all-the-icons-ivy
  :after ivy
  :config
  ;; `all-the-icons-ivy' is incompatible with ivy-rich's switch-buffer
  ;; modifications, so we disable them and merge them ourselves
  (setq all-the-icons-ivy-buffer-commands nil)

  (all-the-icons-ivy-setup))
  ;:after counsel-projectile
  ;  (let ((all-the-icons-ivy-file-commands
  ;         '(counsel-projectile
  ;           counsel-projectile-find-file
  ;           counsel-projectile-find-dir)))
  ;    (all-the-icons-ivy-setup))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ([remap upcase-word] . counsel-M-x)
	  ("C-x b" . counsel-ibuffer)
	  ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))


(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


(use-package magit)

(setq org-directory "/home/jonas/private/documents/org/")

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")

  :hook
  (
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package treemacs
  :ensure t)
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-lists)

(use-package company
  :hook (lsp-mode . company-mode))
(use-package company-box
  :hook (company-mode . company-box-mode))


(defun set-flutter-sdk-dir ()
  (direnv-update-environment)
  (setq lsp-dart-flutter-sdk-dir
        (string-trim-right (shell-command-to-string "echo $FLUTTER_SDK"))))

(use-package dart-mode
  :init
  (add-hook 'dart-mode-hook 'set-flutter-sdk-dir)
  :hook (dart-mode . flutter-test-mode))

(use-package lsp-dart
  :after dart-mode
  :config
  (setq lsp-dart-dap-flutter-hot-reload-on-save t)
    (setq lsp-dart-sdk-dir (expand-file-name "~/private/development/flutter/flutter/bin/cache/dart-sdk"))
    (setq lsp-dart-flutter-sdk-dir (expand-file-name "~/private/development/flutter/flutter/"))
)



(use-package flutter
  :after dart-mode
  :custom
  (flutter-sdk-path "/home/jonas/private/development/flutter/flutter/")
  )


(defun switch-to-flutter()
  (interactive)
  (when-let ((buf (get-buffer "*Flutter*")))
    (switch-to-buffer buf)))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
              "[ \t\n]*$" "" (shell-command-to-string
                      "$SHELL --login -c 'source /home/jonas/.zshrc && echo $PATH'"
                            ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
(setq exec-path (append exec-path '("/bin/aapt")))
(setq exec-path (append exec-path '("/bin/sdkmanager")))
(setq exec-path (append exec-path '("/bin/")))
;(setq exec-path (append exec-path '("/home/jonas/private/development/flutter/flutter/bin")))
;(setq exec-path (append exec-path '("/home/jonas/private/development/flutter/flutter/bin/cache/dart-sdk/bin")))
;; ** Global Keybindings

(general-create-definer my-leader-def

  :states '(normal insert emacs)
  :prefix "SPC"
  :non-normal-prefix "s-SPC")

(my-leader-def
  ;; bind "SPC a"
  "a" 'org-agenda
  "SPC" 'counsel-projectile

  "b d" 'kill-this-buffer
  "b b" 'counsel-ibuffer
  "b [" 'previous-buffer
  "b ]" 'next-buffer
  "f s" 'save-buffer
  "f f" 'counsel-find-file
  "f p" '(lambda() (interactive)(counsel-find-file "~/private/dotfiles/emacs.d/"))
  "o p" 'treemacs
  "p p" 'counsel-projectile-switch-project
  "p a" 'projectile-add-known-project
  "p s" 'projectile-save-project-buffers
  "m c i" 'org-clock-in
  "m c o" 'org-clock-out
  )

(my-leader-def
  :keymaps 'prog-mode-map 
	    ;; bind "SPC a"
	    "c f" #'lsp-format-buffer
	    "c D" #'lsp-goto-implementation
	    "c d" #'lsp-goto-type-definition)

(my-leader-def
  :keymaps 'dart-mode-map 
	    ;; bind "SPC a"
	    "c c" #'flutter-run-or-hot-reload
	    "c C" #'flutter-hot-restart
	    "c h" #'switch-to-flutter)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" default))
 '(package-selected-packages
   '(flutter-l10n-flycheck edebug-inline-result dashboard which-key use-package rainbow-delimiters projectile lsp-ui lsp-dart ivy-rich helpful gruvbox-theme flycheck evil doom-themes doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
