;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
<<<<<<< HEAD
=======
;;(setq doom-font (font-spec :family "Liberation Mono" :size 17))
(setq doom-font (font-spec :family "Iosevka" :size 22))

(after! neotree
  (setq neo-theme 'nerd-icons))

;; Keybindings
(map! "M-m" (lambda () (interactive) (compile "make game")))
(map! :map c-mode-map "<f1>" (cmd! (compile "make clean")))
(map! :map c-mode-map "<f2>" (cmd! (compile "make run")))
(map! :map c-mode-map "<f4>" (cmd! (compile "make engine")))
(map! :map c-mode-map "<f5>" (cmd! (compile "make")))
(map! :map c-mode-map "<f6>" (cmd! (compile "make imgui")))
(map! :map c-mode-map "<f12>" #'+lookup/definition)

(map! :g "C-," #'+evil/next-frame)
(map! :nvi "C-w" #'kill-current-buffer)
(map! :nvi "<C-tab>" #'centaur-tabs-forward)
(map! :nvi "<C-iso-lefttab>" #'centaur-tabs-backward)
>>>>>>> 5090802ba050b2a0e32f7ca81e61b3ad5b2ea908

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

<<<<<<< HEAD
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "C:/dev/org/")


=======
;; Syntax highlighting for code blocks (C, GLSL, HLSL, etc.)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(add-hook! '(c-mode-hook c++-mode-hook) :append
  (defun +my/allman-braces ()
    ;; Open brace on its own line, for if/for/while/functions/etc.
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'inline-open 0)
    (c-set-offset 'block-open 0)
    (c-set-offset 'brace-list-open 0)
    (setq c-hanging-braces-alist
          '((substatement-open before after)
            (brace-list-open before after)
            (block-open before after)
            (defun-open before after)
            (class-open before after)
            (inline-open before after)))
    (setq c-basic-offset 4)))

;; dape
(after! dape
  (add-to-list 'dape-configs
    `(wing-debug
      modes (c-mode c++-mode)
      command "lldb-dap"
      command-cwd dape-cwd-function
      :type "lldb"
      :request "launch"
      :name "Debug wing"
      :program "/home/trist007/dev/wing/wing/bin/wing"
      :cwd "/home/trist007/dev/wing/wing/code"
      :args []
      :stopOnEntry nil)))

;; multicursor
(after! evil-mc
  (global-evil-mc-mode 1))

;; which-func-mode
(which-function-mode 1)

;; Base org directory
(setq org-directory "~/org/")

;; Make gamedev files easy to jump to
(defvar gamedev-dir (concat org-directory "gamedev/"))

;; Capture templates: quick-add notes into the right file without
;; manually opening it first
(after! org
  (setq org-capture-templates
        `(("g" "Gamedev note...")  ; parent menu, no template of its own

          ("ge" "DoomEmacs note" entry
           (file+headline ,(concat gamedev-dir "doomemacs.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gb" "Blender note" entry
           (file+headline ,(concat gamedev-dir "blender.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gc" "Collision note" entry
           (file+headline ,(concat gamedev-dir "collision.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gs" "Shader note" entry
           (file+headline ,(concat gamedev-dir "shaders.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gv" "Vulkan note" entry
           (file+headline ,(concat gamedev-dir "vulkan.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gd" "D3D11 note" entry
           (file+headline ,(concat gamedev-dir "d3d11.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gm" "Math note" entry
           (file+headline ,(concat gamedev-dir "math.org") "Inbox")
           "* %?\n%U\n%a\n")

          ("gg" "Gotcha" entry
           (file+headline ,(concat gamedev-dir "gotchas.org") "Inbox")
           "* %?\n%U\n%a\n"))))

;; RSS feeds
(setq elfeed-feeds
      '("https://www.youtube.com/feeds/videos.xml?channel_id=UCaTznQhurW5AaiYPbhEA-KA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCLRILFZ-sHKYZ8io_IP5_ag"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC9J9u3apteD0EuFjzRpt71w"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCc6-nJ-sW4ZEH3bTOMDHsaQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC8biKfVSZgnwKQiK24ltiEw"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UChXKAI83IuqSneWe92F97jQ"))

(map! :leader
      :desc "elfeed" "o y" #'elfeed)
>>>>>>> 5090802ba050b2a0e32f7ca81e61b3ad5b2ea908
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
<<<<<<< HEAD
(setq magit-git-executable "C:/Program Files/Git/bin/git.exe")

(set-face-attribute 'default nil :family "Iosevka" :height 220) ; height is 1/10 pt

;;; -- Line numbers (Doom's `display-line-numbers-type t') ----------------
(global-display-line-numbers-mode 1)

;;; -- which-function-mode: show current function in the modeline ---------
(which-function-mode 1)

;;; -- Global keybindings --------------------------------------------------
(global-set-key (kbd "M-m") (lambda () (interactive) (compile "make game")))
(global-set-key (kbd "C-,") #'other-frame) ; vanilla equiv. of +evil/next-frame
(global-set-key (kbd "C-c c") #'org-capture)

(map! :n "C-<tab>" #'centaur-tabs-forward
      :n "C-S-<tab>" #'centaur-tabs-backward)

(setq-default tab-width 2
              indent-tabs-mode nil)  ;; nil = spaces, not literal tabs

(map! :map (c-mode-map c++-mode-map)
      :n "C-a" #'align)

(with-eval-after-load 'evil
  ;; evil :nvi bindings (normal/visual/insert states)
        (evil-define-key '(normal visual) 'global (kbd "C-w") #'kill-current-buffer))

;;; -- C/C++: Allman braces + per-project compile keys ---------------------
(defun +my/allman-braces ()
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'block-open 0)
  (c-set-offset 'brace-list-open 0)
  (setq c-hanging-braces-alist
        '((substatement-open before after)
          (brace-list-open before after)
          (block-open before after)
          (defun-open before after)
          (class-open before after)
          (inline-open before after)))
  (setq c-basic-offset 4))

(add-hook 'c-mode-hook #'+my/allman-braces)
(add-hook 'c++-mode-hook #'+my/allman-braces)

(with-eval-after-load 'cc-mode
  (dolist (map (list c-mode-map c++-mode-map))
  (define-key c-mode-map (kbd "<f1>")  (lambda () (interactive) (compile "build clean")))
  (define-key c-mode-map (kbd "<f2>")  (lambda () (interactive) (compile "build run")))
  (define-key c-mode-map (kbd "<f4>")  (lambda () (interactive) (compile "build engine")))
  (define-key c-mode-map (kbd "<f5>")  (lambda () (interactive) (compile "build")))
  (define-key c-mode-map (kbd "<f6>")  (lambda () (interactive) (compile "build imgui")))
  ;; vanilla equivalent of Doom's +lookup/definition (uses eglot's xref backend)
  (define-key c-mode-map (kbd "<f12>") #'xref-find-definitions)))

;;; -- centaur-tabs: group tabs by perspective, so each frame
;;;    (which gets its own perspective via after-make-frame-functions
;;;    in init.el) only shows its own buffers, not other frames' -------
;;;
(with-eval-after-load 'centaur-tabs
  (centaur-tabs-mode 1)
  (defun +my/centaur-tabs-buffer-groups ()
    "Group tabs by the current perspective's name."
    (list (safe-persp-name (get-current-persp))))
  (setq centaur-tabs-buffer-groups-function #'+my/centaur-tabs-buffer-groups))

(with-eval-after-load 'persp-mode
  (add-hook 'persp-activated-hook
            (lambda (&rest _) (centaur-tabs-headline-match))));;

;; Perspective doesn't know centaur-tabs exists, so force it to
;; recompute its tab set whenever you switch frames/perspectives --
;; otherwise the tab bar lags a frame behind until you touch a buffer.
;;(with-eval-after-load 'perspective
;;  (add-hook 'persp-activated-functions
;;            (lambda (&rest _) (centaur-tabs-headline-match))))

;;; -- dape: wing-debug launch config --------------------------------------
;; NOTE: your original config uses lldb-dap. It ships with LLVM on
;; Linux/macOS but is NOT bundled with LLVM-for-Windows installers -- grab
;; lldb-dap.exe from LLVM's GitHub releases and put it on PATH, or switch
;; to a Windows-friendlier adapter (cpptools' DAP server, or gdb 14+'s
;; native DAP support). Update :program/:cwd to your real Windows paths.
(with-eval-after-load 'dape
  (add-to-list 'dape-configs
    `(wing-debug
      modes (c-mode c++-mode)
      command "lldb-dap"
      command-cwd dape-cwd-function
      :type "lldb"
      :request "launch"
      :name "Debug wing"
      :program "C:/Users/<YOUR_USERNAME>/dev/wing/wing/bin/wing.exe"
      :cwd "C:/Users/<YOUR_USERNAME>/dev/wing/wing/code"
      :args []
      :stopOnEntry nil)))

;;; -- org: src blocks, directory, gamedev capture templates ---------------
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  ;; NOTE: update to your actual Windows org directory, e.g. "C:/Users/<YOUR_USERNAME>/org/"
  (setq org-directory "C:/dev/org/")
  (defvar gamedev-dir (concat org-directory "gamedev/"))
  (setq org-capture-templates
        `(("g" "Gamedev note...")
          ("ge" "DoomEmacs note" entry
           (file+headline ,(concat gamedev-dir "doomemacs.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gb" "Blender note" entry
           (file+headline ,(concat gamedev-dir "blender.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gp" "SubstancePainter note" entry
           (file+headline ,(concat gamedev-dir "substancepainter.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gc" "Collision note" entry
           (file+headline ,(concat gamedev-dir "collision.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gf" "Phantom note" entry
           (file+headline ,(concat gamedev-dir "phantom.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gi" "CimgGui note" entry
           (file+headline ,(concat gamedev-dir "cimgui.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gs" "Shader note" entry
           (file+headline ,(concat gamedev-dir "shaders.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gt" "Troubleshooting note" entry
           (file+headline ,(concat gamedev-dir "troubleshooting.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gv" "Vulkan note" entry
           (file+headline ,(concat gamedev-dir "vulkan.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gd" "D3D11 note" entry
           (file+headline ,(concat gamedev-dir "d3d11.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gn" ".NET note" entry
           (file+headline ,(concat gamedev-dir "dotnet.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gm" "Math note" entry
           (file+headline ,(concat gamedev-dir "math.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("g+" "C/C++ note" entry
           (file+headline ,(concat gamedev-dir "c.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("g#" "C# note" entry
           (file+headline ,(concat gamedev-dir "c-sharp.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gh" "Git note" entry
           (file+headline ,(concat gamedev-dir "git.org") "Inbox")
           "* %?\n%U\n%a\n")
          ("gg" "Gotcha" entry
           (file+headline ,(concat gamedev-dir "gotchas.org") "Inbox")
           "* %?\n%U\n%a\n"))))

;;(remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
;;(remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-pushremote)
;;(remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-pushremote)
(remove-hook 'dired-mode-hook #'dired-omit-mode)
=======
>>>>>>> 5090802ba050b2a0e32f7ca81e61b3ad5b2ea908
