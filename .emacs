;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;set the font
;; Iosevka font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 140
                    :weight 'medium)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INSTALL PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
icomplete-mode
(defvar my-required-packages
  '(web-mode
    typescript-mode
    js2-mode
    json-mode
    prettier-js
    company
    yasnippet
    rainbow-mode
    which-key
    magit))

(dolist (pkg my-required-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BASIC SETTINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(global-hl-line-mode -1)

(show-paren-mode 1)
(electric-pair-mode 1)
(which-key-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'tango-dark t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOCOMPLETE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'company)
(global-company-mode 1)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WEB MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)

(add-to-list 'auto-mode-alist
             '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist
             '("\\.jsx?\\'" . web-mode))

(add-to-list 'auto-mode-alist
             '("\\.tsx?\\'" . web-mode))

(add-to-list 'auto-mode-alist
             '("\\.vue\\'" . web-mode))

(add-to-list 'auto-mode-alist
             '("\\.css\\'" . web-mode))

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JAVASCRIPT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'js2-mode)

(add-to-list 'auto-mode-alist
             '("\\.js\\'" . js2-mode))

(add-to-list 'auto-mode-alist
             '("\\.mjs\\'" . js2-mode))

(add-to-list 'auto-mode-alist
             '("\\.cjs\\'" . js2-mode))

(setq js2-basic-offset 2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TYPESCRIPT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'typescript-mode)

(add-to-list 'auto-mode-alist
             '("\\.ts\\'" . typescript-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JSON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'json-mode)

(add-to-list 'auto-mode-alist
             '("\\.json\\'" . json-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JSX / TSX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-jsx-setup ()
  (setq-local js-indent-level 2))

(add-hook 'js2-mode-hook #'my-jsx-setup)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SNIPPETS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet)
(yas-global-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CSS COLORS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'rainbow-mode)

(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'web-mode-hook #'rainbow-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRETTIER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'prettier-js)

(add-hook 'web-mode-hook
          (lambda ()
            (when (member
                   (file-name-extension
                    (or buffer-file-name ""))
                   '("html" "css" "js" "jsx" "ts" "tsx"))
              (prettier-js-mode 1))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHORTCUTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c c") #'compile)

(global-set-key (kbd "C-c f")
                #'find-file)

(global-set-key (kbd "C-c s")
                #'save-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CURSOR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default cursor-type 'bar)
(set-cursor-color "orange")

(setq ring-bell-function 'ignore)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FILE SETTINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq make-backup-files nil)
(setq auto-save-default nil)

(set-language-environment "UTF-8")

(message "Web development environment loaded!")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company js2-mode json-mode magit prettier-js rainbow-mode
	     typescript-mode web-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
