;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval progn
      (local-set-key (kbd "M-m")
       (lambda nil (interactive)
         (compile (format "make -C %s" (project-root (project-current))))))
      (local-set-key (kbd "<f2>")
       (lambda nil (interactive)
         (async-shell-command
          (expand-file-name "renderer.exe" (project-root (project-current)))))))
     (eval progn
      (local-set-key (kbd "M-m") (lambda nil (interactive) (compile "make")))
      (local-set-key (kbd "<f2>")
                     (lambda nil (interactive)
                       (async-shell-command
                        (expand-file-name "renderer.exe"
                                          (project-root (project-current))))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
