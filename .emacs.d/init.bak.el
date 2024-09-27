(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" default))
 '(org-agenda-files '("/home/phil/mylife.org" "~/todo.org"))
 '(package-selected-packages
   '(lua-mode gruvbox-theme atom-dark-theme atom-one-dark-theme which-key linum-relative markdown-mode org-superstar evil))
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

;;(package-refresh-contents)

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
;;(add-to-list 'load-path "~/.emacs.d/elpa/which-key-3.6.0/which-key.el")
;;(require 'which-key)
(which-key-mode)

(setq org-startup-folded t)

(hl-line-mode)
(setq inhibit-startup-message t ; Two variables in one call
      visible-bell nil)

;;(load-theme 'atom-one-dark)
(load-theme 'tango-dark)
;;(load-theme 'gruvbox)

(hl-line-mode 1)
