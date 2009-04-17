(server-start)

;; remove all bells
(setq ring-bell-function 'ignore)
(setq initial-scratch-message nil)

;; no menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; show line and col
(line-number-mode 1)
(column-number-mode 1)

; encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; turn on pending delete (when a region is selected, typing replaces it)
(delete-selection-mode t)
;; when on a tab, make the cursor the tab length
(setq-default x-stretch-cursor t)

;; Bind backspace to C-h, and remap help
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key "\C-xh" 'help-command)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key "\M-g"   'goto-line)
(global-set-key "\C-cc"  'comment-region)
(global-set-key "\C-cu"  'uncomment-region)

(color-theme-zenburn)
(set-face-attribute 'default nil :height 140 :family "Inconsolata")


;; Autosave and backup section shamelessly stolen from topfunky

;; Save backups in one place. Put autosave files (ie #foo#) in one
;; place, *not* scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a
;; regexp are backed up in the corresponding directory. Emacs will mkdir it if
;; necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
(setenv "PAGER" "/usr/bin/emacs")
(setenv "EDITOR" "/usr/bin/emacs")
