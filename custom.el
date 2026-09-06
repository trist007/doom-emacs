;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval progn (setq-local my-terrain-project-root "c:/dev/cielo/cielo/code/")
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive) (compile "build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" "*terrain-output*"
                                       (expand-file-name "run.bat"
                                                         default-directory))))
          (define-key map (kbd "<f3>")
                      (lambda nil (interactive)
                        (start-process "raddbg" nil "raddbg.exe"
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          map))
      (my-terrain-project-mode 1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
