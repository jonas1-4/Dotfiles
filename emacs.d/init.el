;;Looks
(add-to-list 'default-frame-alist '(font . "Fira Code Retina 12"))

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

(use-package all-the-icons)


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

(defun efs/exwm-update-class()
  (exwm-workspace-rename-buffer exwm-class-name))

;(defvar exwm-workspace-previous-index nil "The previous active workspace index.")
;
;(defun exwm-workspace--current-to-previous-index (_x)
;  (setq exwm-workspace-previous-index exwm-workspace-current-index))
;
;(advice-add 'exwm-workspace-switch :before #'exwm-workspace--current-to-previous-index)
;
;(defun exwm-workspace-switch-to-previous ()
;  (interactive)
;  "Switch to the previous active workspace." 
;  (let ((index exwm-workspace-previous-index))
;    (exwm-workspace-switch index)))

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
  (exwm-enable))

;(require 'exwm-randr)
;(setq exwm-randr-workspace-output-plist '(1 "HDMI-1"))
;(add-hook 'exwm-randr-screen-change-hook
;          (lambda ()
;            (start-process-shell-command
;             "xrandr" nil "xrandr --output $EXTERNALSCREEN --left-of $LAPTOPSCREEN --auto")))
;(exwm-randr-enable)


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

(use-package projectile)
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

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer  my-leader-def
  ;; :prefix my-leader
  :prefix "SPC")

(general-create-definer my-local-leader-def
  ;; :prefix my-local-leader
  :prefix "SPC m")

;; ** Global Keybindings
(my-leader-def
  :keymaps 'normal
  ;; bind "SPC a"
  "a" 'org-agenda
  "SPC" 'counsel-projectile
  "p" 'projectile-commander
  "b" 'counsel-bookmark
  "c" 'org-capture))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" default))
 '(package-selected-packages
   '(edebug-inline-result dashboard which-key use-package rainbow-delimiters projectile lsp-ui lsp-dart ivy-rich helpful gruvbox-theme flycheck evil doom-themes doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
