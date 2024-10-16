(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" default))
 '(org-agenda-files '("~/Documents/org_docs/mylife.org"))
 '(package-selected-packages
   '(which-key use-package org-superstar org-bullets markdown-mode lua-mode linum-relative gruvbox-theme evil atom-one-dark-theme atom-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font Mono" :foundry "JB" :slant normal :weight normal :height 128 :width normal))))
 '(region ((t (:extend t :background "#CCCCCC")))))

(load-theme 'gruvbox-dark-medium)

;; Save History
(savehist-mode +1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message
      ";; Hello world.\n")

;; Size of the starting Window
(setq initial-frame-alist '((top . 1)
			    (left . 450)
			    (width . 101)
			    (height . 70)))

;; Use `use-package'
;; This code is not required in Emacs 29 which bundles `use-package'
(eval-when-compile (add-to-list 'load-path "/home/phil/.emacs.d/use-package")
		   (require 'use-package))

;; Set the default directory
(setq default-directory "/home/phil/")

;; Package directory
(add-to-list 'load-path "/home/phil/.emacs.d/Packages")

;; Basic modes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode +1)
(global-visual-line-mode +1)
(delete-selection-mode +1)
(save-place-mode +1)

;; Recent files
(recentf-mode 1)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-check-signature nil)

;; UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

;; Backups
;; URL: https://sachachua.com/dotemacs/index.html
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Quickly access dot emacs
(global-set-key (kbd "C-c i")
		(lambda()
		"Edit emacs config file: ~/.emacs.d/init.el"
		  (interactive)
		  (find-file "~/.emacs.d/init.el")))

;; Quickly access dot emacs d
(global-set-key (kbd "C-c e")
    (lambda()
      (interactive)
      (find-file "~/.emacs.d")))

;; Global keys
;; If you use a window manager be careful of possible key binding clashes
(setq recenter-positions '(top middle bottom))
(global-set-key (kbd "C-1") 'kill-this-buffer)
(global-set-key (kbd "C-<down>") (kbd "C-u 1 C-v"))
(global-set-key (kbd "C-<up>") (kbd "C-u 1 M-v"))
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-c c") 'calendar)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "C-x C-j") 'dired-jump)
(global-set-key (kbd "C-c r") 'remember)

;; dired
(setq dired-listing-switches "-alt --dired --group-directories-first -h -G")

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
(setq dired-omit-files
      "\\`[.]?#\\|\\.java\\|snap\\|System\\|\\.ssh\\|\\.gitconfig\\|\\.wget\\|\\.aspell\\|\\.cache\\|\\.lesshst\\|\\.gftp\\|\\.pki\\|\\.gnome\\|VirtualBox\\|master\\.tar\\.gz\\|\\.wine\\|plan9port\\|\\.idm\\|\\.font\\|\\.iso\\|\\.cargo\\|lib\\|amd64\\|\\.gnupg\\|\\.python\\|\\.var\\|\\.local\\|\\`[.][.]?\\'")





(setq case-fold-search t)

(setq sentence-end-double-space nil)

;; Browse URLS in text mode
(global-goto-address-mode +1)

;; FINIS

;; Evil configuration
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode t)


;; Configuration of package 'which-key'
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

 '(cursor ((t (:background "PeachPuff"))))
 '(hl-line ((t (:background "#454545"))n))

;;(linum-mode t)
(require 'linum-relative)
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        org-mode configuration            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c a") 'org-agenda)
;;(define-key org-mode-map (kbd "<C-left>") 'org-shiftleft)
;;(define-key org-mode-map (kbd "<C-right>") 'org-shiftright)
(setq org-icalendar-include-todo t)
;;(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(add-hook 'org-mode-hook (auto-fill-mode t))

;;(require 'org-journal)
;;(setq org-capture-templates
;;      '(("t" "Todo" entry (file+headline "~/Dropbox/Apps/Emacs/tasks.org" "Tasks")
;;             "* TODO \n  - %?\n  %i\n  %a")
;;    ("c" "Computing Stuff" entry (file+headline "~/Dropbox/Apps/Emacs/computer_stuff.org" "New Captures")
;;                      "* TODO \n  - %?\n  %i\n  %a")
;;    ("d" "Desktop Notes" entry (file+headline "~/Dropbox/Apps/Emacs/desktop_notes.org" "New Captures")
;;                      "* TODO \n  - %?\n  %i\n  %a")
;;    ("e" "Emacs" entry (file+headline "~/Dropbox/Apps/Emacs/emacs.org" "New Captures")
;;                      "* TODO \n  - %?\n  %i\n  %a")
;;    ("g" "GDB" entry (file+headline "~/Dropbox/Apps/Emacs/gdb.org" "New Capture")
;;                      "* TODO \n  - %?\n  %i\n  %a")
;;        ("j" "Journal" entry (file+datetree "~/Dropbox/Apps/Emacs/journal.org")
;;         "* \n  - %?\nEntered on %U\n  %i\n  %a")
;;    ("m" "Mylife" entry (file+headline "~/Dropbox/Apps/Emacs/mylife.org" "New Captures")
;;                      "* TODO \n  - %?\n  %i\n  %a")
;;    ("v" "Vim" entry (file+headline "~/Dropbox/Apps/Emacs/vim.org" "New Capture")
;;                      "* TODO \n  - %?\n  %i\n  %a")))

;; Some nice bullets for org mode.
(require 'org-superstar)
   (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
