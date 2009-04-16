;; Bind backspace to C-h, and remap help
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key "\C-xh" 'help-command)

(global-set-key (kbd "C-x C-g") 'find-grep)
