;; Basic configuration for emacs
;; Configuration inspired from github.com/tuedachu/dotfiles.git

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; List of packages used by `package-install-selected-packages'.
(setq package-selected-packages '(transfer-sh helm-pass helm-company company pdf-tools undo-tree markdown-mode wgrep-helm wgrep fish-completion magit helm-system-packages helm with-editor))

;; Query of ssh, gpg, etc. passphrases from within emacs
(pinentry-start)

;; Enter your full name here
(setq user-full-name "John Doe")

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; helm incremental completion and narrowing selection framework
(load "config-helm")

(setq custom-file "/tmp/emacs-custom-file.el")
(setq helm-source-names-using-follow '("All Eshell prompts" "Regexp Builder" "Variables" "Imenu" "Occur"))

(set-face-attribute 'default nil :foreground "white" :background "black")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono"))

;; Unbind <C-z>
(global-set-key (kbd "C-z") nil)
;; comment line
(global-set-key (kbd "M-;") 'comment-line)
;; Bind menu to nothing
(global-set-key (kbd "<menu>") nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))

(setq make-backup-files nil)

(require 'undo-tree)
(global-undo-tree-mode)

;; Prevent to split vertically the window
(setq split-height-threshold nil)
(setq split-width-threshold 100)

(setq magit-diff-refine-hunk 'all)
(put 'erase-buffer 'disabled nil)

(require 'transfer-sh)
