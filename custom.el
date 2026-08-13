;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("333b0cc0f985744d97beebf433542bb93b314b331117aa57e91103dbec9c29fe"
     "7d9c94cc1edddc6162c89c85bbdeed14e5b93a21ec83a55710d6a501bf295cf7"
     "4732feaaeab14f39b62cb922096749d0e9c5d561f6192e13dc2a3d8729d1fd4b"
     "998bc02f2e52205ad06df88a14d53168aef1ec1bbcc6fe2b0cd15fed8e5c8dae" default))
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
