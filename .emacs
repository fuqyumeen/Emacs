;; -*- lexical-binding: t; --

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; PACKAGE MANAGEMENT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/") ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(defvar my-required-packages '(web-mode typescript-mode js2-mode json-mode prettier-js company yasnippet rainbow-mode which-key magit))

(dolist (pkg my-required-packages) (unless (package-installed-p pkg) (package-install pkg)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; FONT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'default nil :family "Iosevka" :height 140 :weight 'medium)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; BASIC SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-screen t)

(menu-bar-mode -1) (tool-bar-mode -1) (scroll-bar-mode -1)

(global-display-line-numbers-mode 1) (column-number-mode 1)

(show-paren-mode 1) (electric-pair-mode 1) (which-key-mode 1)

;; Enable native syntax highlighting (global-font-lock-mode 1) (setq font-lock-maximum-decoration t) (setq font-lock-maximum-size nil)

;; Better highlighting (setq-default truncate-lines nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; THEME ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'tango-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; AUTOCOMPLETE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'company)

(global-company-mode 1)

(setq company-minimum-prefix-length 1) (setq company-idle-delay 0.2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; WEB MODE: HTML / JSX / TSX / VUE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\.html?\'" . web-mode))

(add-to-list 'auto-mode-alist '("\.jsx\'" . web-mode))

(add-to-list 'auto-mode-alist '("\.tsx\'" . web-mode))

(add-to-list 'auto-mode-alist '("\.vue\'" . web-mode))

;; Enable syntax highlighting in web-mode (setq web-mode-enable-auto-closing t) (setq web-mode-enable-auto-pairing t) (setq web-mode-enable-css-colorization t) (setq web-mode-enable-current-element-highlight t)

;; Syntax highlighting for embedded languages (setq web-mode-enable-block-face t) (setq web-mode-enable-part-face t)

;; Indentation (setq web-mode-markup-indent-offset 2) (setq web-mode-css-indent-offset 2) (setq web-mode-code-indent-offset 2)

;; JSX / TSX highlighting (setq web-mode-content-types-alist '(("jsx" . "\.jsx?\'") ("tsx" . "\.tsx\'")))

(add-hook 'web-mode-hook (lambda () (setq-local font-lock-maximum-decoration t) (setq-local web-mode-enable-auto-quoting t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; JAVASCRIPT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\.js\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\.mjs\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\.cjs\'" . js2-mode))

(setq js2-basic-offset 2)

;; Highlight functions, variables, and keywords (setq js2-highlight-level 3)

(add-hook 'js2-mode-hook (lambda () (setq-local js-indent-level 2) (setq-local font-lock-maximum-decoration t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; TYPESCRIPT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'typescript-mode)

(add-to-list 'auto-mode-alist '("\.ts\'" . typescript-mode))

(setq typescript-indent-level 2)

(add-hook 'typescript-mode-hook (lambda () (setq-local font-lock-maximum-decoration t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; CSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\.css\'" . css-mode))

(setq css-indent-offset 2)

(add-hook 'css-mode-hook (lambda () (setq-local font-lock-maximum-decoration t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; JSON ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'json-mode)

(add-to-list 'auto-mode-alist '("\.json\'" . json-mode))

(setq json-reformat:indent-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; OTHER WEB FILES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\.scss\'" . css-mode))

(add-to-list 'auto-mode-alist '("\.sass\'" . css-mode))

(add-to-list 'auto-mode-alist '("\.less\'" . css-mode))

(add-to-list 'auto-mode-alist '("\.xml\'" . xml-mode))

(add-to-list 'auto-mode-alist '("\.ya?ml\'" . yaml-mode))

(add-to-list 'auto-mode-alist '("\.md\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\.sql\'" . sql-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; SNIPPETS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet)

(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; CSS COLORS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'rainbow-mode)

(add-hook 'css-mode-hook #'rainbow-mode) (add-hook 'web-mode-hook #'rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; PRETTIER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'prettier-js)

(add-hook 'web-mode-hook (lambda () (when (member (file-name-extension (or buffer-file-name "")) '("html" "css" "js" "jsx" "ts" "tsx")) (prettier-js-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; SHORTCUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c c") #'compile) (global-set-key (kbd "C-c f") #'find-file) (global-set-key (kbd "C-c s") #'save-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; CURSOR ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default cursor-type 'bar) (set-cursor-color "orange")

(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; FILE SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq make-backup-files nil) (setq auto-save-default nil)

(set-language-environment "UTF-8")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; NO TREE-SITTER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do not activate Tree-sitter automatically. (setq major-mode-remap-alist nil)

(when (fboundp 'global-treesit-auto-mode) (global-treesit-auto-mode -1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;; FINAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Web development environment loaded!")
