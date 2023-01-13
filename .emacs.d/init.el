(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(org-agenda-files '("/home/phil/mylife.org" "~/todo.org"))
 '(package-selected-packages
   '(which-key linum-relative markdown-mode org-superstar evil))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font Mono" :foundry "JB" :slant normal :weight normal :height 120 :width normal)))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


 (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; Enable tab key to cycle through outlines in org-mode
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

;; Lua language support
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lua . t)))

;; org mode
(require 'org)

;; Line numbers
(linum-relative-global-mode)

;; Which-key
;;(add-to-list 'load-path "path/to/which-key.el")
(add-to-list 'load-path "~/.emacs.d/elpa/which-key-3.6.0/which-key.el")
(require 'which-key)
(which-key-mode)
