;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e184d8607cc9933f2ba8e180699365bdf8b6f311834a9e15c71947b38be0caa3"
     "2b0531a540f4b51e524f551ed7374099f9d743b4de458ade0c52ba18ee6bfe46"
     "8f787ed2d75bb7073796c00f7e1033d6e92f39314939446dd2d8e95cbc168422"
     "333b0cc0f985744d97beebf433542bb93b314b331117aa57e91103dbec9c29fe"
     "7d9c94cc1edddc6162c89c85bbdeed14e5b93a21ec83a55710d6a501bf295cf7"
     "4732feaaeab14f39b62cb922096749d0e9c5d561f6192e13dc2a3d8729d1fd4b"
     "998bc02f2e52205ad06df88a14d53168aef1ec1bbcc6fe2b0cd15fed8e5c8dae" default))
 '(package-selected-packages '(vterm))
 '(safe-local-variable-values
   '((eval progn
      (let ((root (locate-dominating-file default-directory "build.bat")))
       (when (stringp root) (setq-local default-directory root)))
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive) (compile "build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" nil
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          (define-key map (kbd "<f3>")
                      (lambda nil (interactive)
                        (start-process "raddbg" nil "raddbg.exe"
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (setq-local default-directory
                  (locate-dominating-file default-directory "build.bat"))
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive) (compile "build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" nil
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          (define-key map (kbd "<f3>")
                      (lambda nil (interactive)
                        (start-process "raddbg" nil "raddbg.exe"
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive)
                        (compile "cielo/code/build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" nil
                                       (expand-file-name
                                        "cielo/code/terrain.exe"
                                        default-directory))))
          (define-key map (kbd "<f3>")
                      (lambda nil (interactive)
                        (start-process "raddbg" nil "raddbg.exe"
                                       (expand-file-name
                                        "cielo/code/terrain.exe"
                                        default-directory))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive) (compile "build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" nil
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          (define-key map (kbd "<f3>")
                      (lambda nil (interactive)
                        (start-process "raddbg" nil "raddbg.exe"
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive) (compile "build.bat")))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (start-process "terrain" nil
                                       (expand-file-name "terrain.exe"
                                                         default-directory))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (define-minor-mode my-terrain-project-mode
        "Local keybindings for this project directory."
        :lighter "" :keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-m")
                      (lambda nil (interactive)
                        (let
                            ((default-directory
                              (file-name-directory
                               (or buffer-file-name default-directory))))
                          (compile "build.bat"))))
          (define-key map (kbd "<f2>")
                      (lambda nil (interactive)
                        (let
                            ((default-directory
                              (file-name-directory
                               (or buffer-file-name default-directory))))
                          (start-process "terrain" nil
                                         (expand-file-name "terrain.exe"
                                                           default-directory)))))
          map))
      (my-terrain-project-mode 1))
     (eval progn
      (local-set-key (kbd "M-m")
                     (lambda nil (interactive)
                       (compile
                        (format "make -C %s" (project-root (project-current))))))
      (local-set-key (kbd "<f2>")
                     (lambda nil (interactive)
                       (async-shell-command
                        (expand-file-name "renderer.exe"
                                          (project-root (project-current)))))))
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
