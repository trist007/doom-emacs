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
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "C:/dev/org/")

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
(defvar my/original-path (getenv "PATH")
  "PATH captured once at Emacs startup, before any vcvars loading.")
(defvar my/original-exec-path exec-path
  "exec-path captured once at Emacs startup, before any vcvars loading.")
(setq vc-handled-backends nil)
;;(defun my/load-vcvars (&optional arch)
;;  "Load MSVC environment variables into Emacs's process-environment.
;;Always starts from the original PATH/exec-path to avoid duplicate accumulation."
;;  (interactive)
;;  (let* ((arch (or arch "x64"))
;;         (vcvarsall "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\Build\\vcvarsall.bat")
;;         (cmd (format "\"%s\" %s && set" vcvarsall arch))
;;         (output (shell-command-to-string (format "cmd.exe /c \"%s\"" cmd))))
;;    ;; Reset to baseline before applying vcvars, so repeated calls don't stack
;;    (setenv "PATH" my/original-path)
;;    (setq exec-path my/original-exec-path)
;;    (dolist (line (split-string output "\n"))
;;      (when (string-match "^\\([A-Za-z_][A-Za-z0-9_]*\\)=\\(.*\\)$" line)
;;        (let ((var (match-string 1 line))
;;              (val (string-trim (match-string 2 line))))
;;          (if (string-equal (upcase var) "PATH")
;;              (progn
;;                (setenv "PATH" (concat val ";" my/original-path))
;;                (setq exec-path (append (split-string val ";") my/original-exec-path)))
;;            (setenv var val)))))
;;    (message "MSVC environment loaded (%s)" arch)))

(setq magit-git-executable "C:/Program Files/Git/bin/git.exe")
(setq magit-refresh-status-buffer nil) ; if you don't need status auto-refreshed constantly
(setq magit-diff-refine-hunk nil) ; word-level diff highlighting is expensive; nil disables, 'all enables everywhere

;;(add-to-list 'exec-path "C:/raddbg")
;; Define your favorite themes here
(defvar my-favorite-themes '(doom-one
                             doom-dracula
                             doom-Iosvkem
                             doom-palenight
                             doom-tokyo-night
                             doom-wilmersdorf
                             doom-outrun-electric
                             doom-winter-is-coming-dark-blue)
  "List of my favorite themes to choose from.")

;; Create a command to choose only from your favorites
;;(defun my/choose-favorite-theme ()
;;  "Read a theme from my-favorite-themes and load it."
;;  (interactive)
;;  (let ((chosen-theme (completing-read "Load favorite theme: " my-favorite-themes)))
;;    (when chosen-theme
;;      (setq doom-theme (intern chosen-theme))
;;      (load-theme (intern chosen-theme) t))))
;;
;;
(defun my/choose-favorite-theme ()
  "Read and instantly preview a theme from my-favorite-themes."
  (interactive)
  (let ((original-theme doom-theme)
        (chosen-theme nil))
    (unwind-protect
        (progn
          (setq chosen-theme
                (completing-read
                 "Preview favorite theme: "
                 my-favorite-themes
                 nil t nil nil nil nil))
          (when chosen-theme
            (setq doom-theme (intern chosen-theme))
            (load-theme (intern chosen-theme) t)))
      ;; If the user hits ESC / aborts, revert back to the original theme
      (unless chosen-theme
        (setq doom-theme original-theme)
        (load-theme original-theme t)))))

;; Bind the command to a convenient shortcut (e.g., SPC h T)
(map! :leader
      :desc "Load favorite theme" "h T" #'my/choose-favorite-theme)

(setq epg-gpg-program "C:/msys64/usr/bin/gpg.exe")

(after! emms
  (require 'emms-player-mpv)
  (add-to-list 'emms-player-list 'emms-player-mpv)
  (setq emms-player-mpv-executable "C:/ProgramData/chocolatey/lib/mpvio.install/tools/mpv.exe"))

(defun my/move-line-up ()
  "Move the current line up one line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(map! "M-k" #'my/move-line-up)

(defun my/move-line-down ()
  "Move the current line down one line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(map! "M-j" #'my/move-line-down)


(set-face-attribute 'default nil :family "Iosevka" :height 220) ; height is 1/10 pt

;;; -- Line numbers (Doom's `display-line-numbers-type t') ----------------
(global-display-line-numbers-mode 1)

;;; -- which-function-mode: show current function in the modeline ---------
(which-function-mode 1)

;;; -- Global keybindings --------------------------------------------------
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
  (define-key c-mode-map (kbd "M-m")   (lambda () (interactive) (compile "build game")))
  (define-key c-mode-map (kbd "M-M")   (lambda () (interactive) (compile "build game2")))
  (define-key c-mode-map (kbd "<f1>")  (lambda () (interactive) (compile "clean")))

;;  (define-key c-mode-map (kbd "<f2>")  (lambda () (interactive) (compile "run")))
;;
;;  (define-key c-mode-map (kbd "<f3>")
;;    (lambda () (interactive)
;;      (let ((default-directory "C:/dev/wing/wing/code"))
;;        (compilation-start "debug.bat" t))))
;;
;;
    (define-key c-mode-map (kbd "<f2>")
    (lambda () (interactive)
        (let ((default-directory "C:/dev/wing/wing/bin/"))
        (compilation-start "C:/dev/wing/wing/code/run.bat vulkan" t))))

    (define-key c-mode-map (kbd "<f3>")
    (lambda () (interactive)
        (let ((default-directory "C:/dev/wing/wing/bin/"))
        (compilation-start "C:/dev/wing/wing/code/debug.bat" t))))

  (define-key c-mode-map (kbd "<f4>")  (lambda () (interactive) (compile "build engine")))
  (define-key c-mode-map (kbd "<S-f4>")(lambda () (interactive) (compile "build engine2")))
  (define-key c-mode-map (kbd "<f5>")  (lambda () (interactive) (compile "build main")))
  (define-key c-mode-map (kbd "<f6>")  (lambda () (interactive) (compile "build imgui")))
  (define-key c-mode-map (kbd "<S-f6>")(lambda () (interactive) (compile "build imgui2")))
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
          ("go" "Org note" entry
           (file+headline ,(concat gamedev-dir "orgmode.org") "Inbox")
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

(use-package! djvu)

(use-package! org-noter
  :after djvu)


;;(setq auth-sources '("~/.authinfo.gpg"))
;;
;;(after! circe
;;  (set-irc-server! "irc.us.libera.chat"
;;    `(:tls t
;;      :port 6697
;;      :nick "trist007"
;;      :sasl-username "trist007"
;;      :sasl-password
;;      (lambda (&rest _)
;;        (let ((match (car (auth-source-search :host "irc.us.libera.chat"))))
;;          (if match
;;              (let ((secret (plist-get match :secret)))
;;                (if (functionp secret) (funcall secret) secret))
;;            (error "No auth-source entry for irc.us.libera.chat"))))
;;      :channels ("##c" "##asm"))))
;;      
(setq fixme-modes '(c++-mode c-mode asm-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(StUDY\\)" 1 'font-lock-study-face t)
           ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Red" nil nil t nil t nil nil)

(after! hl-todo
  (setq hl-todo-keyword-faces
        (cons '("NOTE" . "Red")
              (assoc-delete-all "NOTE" (assoc-delete-all "TODO" hl-todo-keyword-faces)))))

;; Insert "// NOTE(trist007): " at point
(defun +trist/insert-note-comment ()
  "Insert a comment-syntax-aware NOTE tag."
  (interactive)
  (insert "// NOTE(trist007): "))
  ;; (insert (concat (string-trim-right comment-start) " NOTE(trist007): ")))

(defun +trist/insert-todo-comment ()
  "Insert a comment-syntax-aware TODO tag."
  (interactive)
  ;; (insert (concat (string-trim-right comment-start) " TODO(trist007): ")))
  (insert "// TODO(trist007): "))

(map! "M-y" #'+trist/insert-note-comment)
(map! "M-t" #'+trist/insert-todo-comment)
