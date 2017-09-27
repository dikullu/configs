;;; RECOMMENDED SETTINGS

;;; package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(unless package-archive-contents (package-refresh-contents))
(package-initialize)

;;; column numbers
(column-number-mode 1)

;;; line numbers in the side bar
(global-linum-mode 1)

;;; hide the gnu startup screen
(setq inhibit-startup-screen 1)

;; Keep a list of recently opened files, and set F7 to list recently opened file
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; highlight matching parantheses
(show-paren-mode 1)



;;; FSHARP SETTINGS

(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))

(require 'fsharp-mode)

(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

;; NB: These following two lines should contain the correct path to the
;;fsharp executables (which depends on operating system).
(setq inferior-fsharp-program "/usr/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/bin/fsharpc")


;;; OPTIONAL SETTINGS (settings are disabled if line begins with a semicolon ;)

;;; These are outcommented because they may be confusing for new Emacs users,
;;; but included because they are very useful.
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (blink-cursor-mode -1)
;; (ido-mode 1) ;; press Alt-X to see the difference ;)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("5c64430cb8e12e2486cd9f74d4ce5172e00f8e633095d27edd212787a4225245" default)))
 '(package-selected-packages (quote (fsharp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;; transparrent background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;;; EASY BUFFER NAVIGATION
;;;
;;; press C-{left,right} to switch buffers
(defun bufmove-default-keybindings (&optional modifier)
  "Set up keybindings for switching between buffers in current window."
  (interactive)
  (unless modifier (setq modifier 'control))
  (global-set-key (vector (list modifier 'left)) 'previous-buffer)
  (global-set-key (vector (list modifier 'right)) 'next-buffer)
  (global-set-key (kbd "C-<left>") 'previous-buffer)
  (global-set-key (kbd "C-<right>") 'next-buffer)
  )

(bufmove-default-keybindings)

;;; easy nagivation between windows
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)

;;; backup directory
(defvar backup-directory "~/backup/emacs/")
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
