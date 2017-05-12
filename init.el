;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------


(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
     ("melpa" . "http://elpa.zilongshanren.com/melpa/")
     ("org"   . "http://elpa.zilongshanren.com/org/")))

(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
(elpy-enable)
(pyvenv-activate "/home/user/myenv")
;;
(setq venv-location "~/Program/py3env/")
(use-package magit
  :ensure)
(use-package elisp-mode
  :config
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
  )
(use-package projectile
  :ensure)
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))
;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally


;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile magit use-package elpy material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
