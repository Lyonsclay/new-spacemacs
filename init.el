;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     javascript
     flow
     lsp
     go
     treemacs
     ;; (treemacs :variables
     ;;           treemacs-use-follow-mode t)
     auto-completion
     ;; better-defaults
     emacs-lisp
     helm
     markdown
     multiple-cursors
     themes-megapack
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     nginx
     csv
     python
     json
     emoji
     git
     html
     ocaml
     colors
     osx
     github
     yaml
     docker
     elixir
     erlang
     semantic
     javascript
     react
     prettier
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     (reason-mode
      :location (recipe
                 :repo "reasonml-editor/reason-mode"
                 :fetcher github
                 :files ("reason-mode.el" "refmt.el" "reason-indent.el" "reason-interaction.el")))
     utop
     ;; evil-terminal-cursor-changer
     company-flx
     dired-collapse
     ;; helpful
     ;; org-gcal
     ;; xclip
     company-flow
     key-chord
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(atom-one-dark
                         doom-peacock
                         seti
                         gruvbox-dark-medium
                         dakrone
                         naquadah
                         monokai
                         doom-vibrant)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro for Powerline Medium"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 20

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."


  (setq node-add-modules-path t)

  ;; Fix powerline separator colors on mac
  (setq powerline-image-apple-rgb t)

  ;; Hide title bar
  ;; (setq initial-frame-alist '((undecorated . t)))

  (setq exec-path-from-shell-arguments '("-l"))
  (add-to-list 'auto-mode-alist '("\\.?\\(bashrc\\|zshrc\\|shellrc\\|bash_profile\\)" . sh-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.?\\(eslintrc\\)" . json-mode))

  ;; Require certificates to actually be valid (this may require additional configuration,)
  ;; https://glyph.twistedmatrix.com/2015/11/editor-malware.html
  (let ((trustfile "/usr/local/etc/libressl/cert.pem"))
    (setq tls-program
          (list
           (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                   (if (eq window-system 'w32) ".exe" "") trustfile)))
    (setq gnutls-trustfiles (list trustfile)))
  (setq gnutls-verify-error nil)
  (setq tls-checktrust t)

  ;; This makes it so that the window will only split vertically (top and
  ;; bottom) if there are at least 100 lines visible. In practice, this makes it
  ;; split horizontally (left and right) most of the time.
  ;; (setq split-height-threshold 100)
  ;; (setq winum-scope 'frame-local)
  ;; (setq frame-resize-pixelwise t)
  (setq create-lockfiles nil)
  (setq require-final-newline t)
  ;; (setq inhibit-compacting-font-caches t)

  (setq report-emacs-bug-no-explanations t)

  ;; smartparens
  ;; (setq sp-highlight-pair-overlay nil)
  ;; Company
  ;; Fuzzy completion
  ;; (with-eval-after-load 'company
  ;;   (company-flx-mode +1))

  ;; Speed up autocomplete popup
  (setq company-idle-delay 0.1)

  ;; (setq message-send-mail-function 'smtpmail-send-it)
  (setq message-kill-buffer-on-exit t)

  (add-hook 'before-make-frame-hook
            (lambda ()
              (unless window-system
                (menu-bar-mode -1))))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (use-package lsp-mode
    :commands (lsp lsp-deferred))

  (add-hook 'go-mode-hook #'lsp-deferred)

  ;; optional - provides fancier overlays
  (use-package lsp-ui
    :commands lsp-ui-mode)

  ;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
  (use-package company-lsp
    :commands company-lsp)

  (add-to-list 'load-path (expand-file-name "lisp" dotspacemacs-directory))
  (let ((default-directory (expand-file-name "packages" dotspacemacs-directory)))
    (if (file-exists-p default-directory)
        (normal-top-level-add-subdirs-to-load-path)))


  ;; (setq flycheck-check-syntax-automatically '(save mode-enable))
  ;; the default value was '(save idle-change new-line mode-enabled)
  ;; '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
  (setq flycheck-display-errors-delay 3.5)
  ;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
  (defun flow/set-flow-executable ()
    (interactive)
    (let* ((os (pcase system-type
                 ('darwin "osx")
                 ('gnu/linux "linux64")
                 (_ nil)))
           (root (locate-dominating-file  buffer-file-name  "node_modules/flow-bin"))
           (executable (car (file-expand-wildcards
                             (concat root "node_modules/flow-bin/*" os "*/flow")))))
      (setq-local company-flow-executable executable)
      ;; These are not necessary for this package, but a good idea if you use
      ;; these other packages
      (setq-local flow-minor-default-binary executable)
      (setq-local flycheck-javascript-flow-executable executable)))

  ;; Set this to the mode you use, I use rjsx-mode
  (add-hook 'rjsx-mode-hook #'flow/set-flow-executable t)



  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)


  (defun save-all ()
  (interactive)
  (save-some-buffers t))

  (add-hook 'focus-out-hook 'save-all)

  (require 'key-chord)
  (key-chord-mode t)
  (key-chord-define-global "jk" 'evil-normal-state)
  (key-chord-define-global "JK" 'evil-normal-state)

  (windmove-default-keybindings 'super)
  (progn
    ;; automatically save buffers associated with files on buffer switch
    ;; and on windows switch
    (defadvice switch-to-buffer (before save-buffer-now activate)
      (when buffer-file-name (save-buffer)))
    (defadvice other-window (before other-window-now activate)
      (when buffer-file-name (save-buffer)))
    (defadvice windmove-up (before other-window-now activate)
      (when buffer-file-name (save-buffer)))
    (defadvice windmove-down (before other-window-now activate)
      (when buffer-file-name (save-buffer)))
    (defadvice windmove-left (before other-window-now activate)
      (when buffer-file-name (save-buffer)))
    (defadvice windmove-right (before other-window-now activate)
      (when buffer-file-name (save-buffer)))
    )
  ;; (advice-add 'select-window :after save-buffer)
  ;; (advice-add 'save-buffer :after #'select-buffer)
  ;; (advice-add (when buffer-file-name 'save-buffer) :after #'select-buffer)
  ;; (advice-add 'select-buffer :after #'his-tracing-function)

  (defadvice select-window (before other-window activate)
    (when buffer-file-name (save-buffer)))

  (global-set-key (kbd "M-{") 'insert-pair)
  (global-set-key (kbd "M-[") 'insert-pair)
  (global-set-key (kbd "M-\"") 'insert-pair)
  (global-set-key (kbd "M-'") 'insert-pair)
  (global-set-key (kbd "M-(") 'insert-pair)
  (global-set-key (kbd "M-`") 'insert-pair)
  (global-set-key (kbd "M-<") 'insert-pair)
  (global-set-key (kbd "M-)") 'delete-pair)


  (require 'multiple-cursors)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


  (when (eq system-type 'darwin)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil))

  ;;----------------------------------------------------------------------------
  ;; Reason setup
  ;;----------------------------------------------------------------------------

  (defun shell-cmd (cmd)
    "Returns the stdout output of a shell command or nil if the command returned
       an error"
    (car (ignore-errors (apply 'process-lines (split-string cmd)))))

  ;; (require 'company-simple-complete)
  ;; (require 'fill-or-unfill)
  ;; (require 'quiet-emacs)

  ;; (use-package helpful
  ;;   :defer t
  ;;   :commands
  ;;   (helpful-function helpful-command helpful-macro))


  ;; Prefer dumb-jump over evil to definition
  ;; (setq spacemacs-default-jump-handlers (delete 'dumb-jump-go spacemacs-default-jump-handlers))
  ;; (push 'dumb-jump-go spacemacs-default-jump-handlers)
  ;; (setq dumb-jump-prefer-searcher 'rg)

  ;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (eval-after-load 'flycheck
    '(flycheck-credo-setup))
  (add-hook 'elixir-mode-hook 'flycheck-mode)

  ;; Indentation
  (setq
   sh-basic-offset 2
   sh-indentation 2
   css-indent-offset 2)

  ;; (spacemacs/enable-flycheck 'sh-mode)

  ;; Prevent persp from loading existing perspectives when opening new frames.
  ;; This fixes a flash of another buffer when opening things from the terminal.
  ;; https://github.com/Bad-ptr/persp-mode.el/issues/64
  ;; https://github.com/Bad-ptr/persp-mode.el/issues/36
  ;; (setq persp-emacsclient-init-frame-behaviour-override nil)
  ;; Don't care if I kill a buffer from a foreign persp
  ;; (setq persp-kill-foreign-buffer-behaviour nil)
  ;; (setq dtrt-indent-max-merge-deviation 9.0)

  ;; ivy
  ;; Use fuzzy finder
  ;; (setq ivy-re-builders-alist
  ;;       '((message-tab . ivy--regex-ignore-order)
  ;;         (swiper . ivy--regex-plus)
  ;;         (t . ivy--regex-fuzzy)))
  ;; Do not insert ^
  ;; (setq ivy-initial-inputs-alist nil)
  ;; (add-to-list 'ivy-sort-functions-alist '(message-tab))

  ;; Add `M-o v' and `M-o s' to open projectile files and buffers in splits
  ;; from ivy
  ;; (with-eval-after-load 'counsel-projectile
  ;;   (ivy-set-actions
  ;;    'counsel-projectile-find-file
  ;;    '(("v" aj/projectile-find-file-vsplit "in vertical split")
  ;;      ("s" aj/projectile-find-file-split "in horizontal split")
  ;;      ("d" aj/projectile-delete-file-confirm "delete file"))))
  ;; (ivy-set-actions
  ;;  'ivy-switch-buffer
  ;;  '(("v" aj/pop-to-buffer-vsplit "in vertical split")
  ;;    ("s" aj/pop-to-buffer-split "in horizontal split")))
  ;; ;; Add i and w to ivy actions to insert/copy the selection
  ;; (ivy-set-actions
  ;;  t
  ;;  '(("i" aj/ivy-insert "insert")
  ;;    ("w" aj/ivy-kill-new "copy")))
  ;; (ivy-set-actions
  ;;  'spacemacs/counsel-search
  ;;  spacemacs--ivy-grep-actions)

  ;; (defun aj/projectile-find-file-split (file)
  ;;   (spacemacs/find-file-split (expand-file-name file (projectile-project-root))))
  ;; (defun aj/projectile-find-file-vsplit (file)
  ;;   (spacemacs/find-file-vsplit (expand-file-name file (projectile-project-root))))
  ;; (defun aj/projectile-delete-file-confirm (file)
  ;;   (spacemacs/delete-file-confirm (expand-file-name file (projectile-project-root))))
  ;; (defun aj/pop-to-buffer-vsplit (buffer)
  ;;   (pop-to-buffer buffer '(spacemacs//display-in-split (split-side . right))))
  ;; (defun aj/pop-to-buffer-split (buffer)
  ;;   (pop-to-buffer buffer '(spacemacs//display-in-split (split-side . below))))
  ;; (defun aj/ivy-insert (x)
  ;;   (insert
  ;;    (if (stringp x)
  ;;        x
  ;;      (car x))))
  ;; (defun aj/ivy-kill-new (x)
  ;;   (kill-new
  ;;    (if (stringp x)
  ;;        x
  ;;      (car x))))

  (setq
   ;; Use bash because it's faster
   shell-file-name "/bin/bash"

   ;; Spaceline
   ;; spaceline-minor-modes-p nil

   ;; File name completion
   read-file-name-completion-ignore-case t
   read-buffer-completion-ignore-case t

   ;; Miscellaneous

   vc-follow-symlinks t
   require-final-newline t

   ;; Enable midnight-mode to clean old buffers every day
   midnight-mode t)
  

  ;; Key Bindings
  (global-set-key (kbd "M-]") 'sp-slurp-hybrid-sexp)
  (global-set-key (kbd "C-x C-l") 'evil-complete-next-line)

  ;; (spacemacs/set-leader-keys "SPC" 'avy-goto-char-2)
  (setq avy-timeout-seconds 0.2)

  (spacemacs/set-leader-keys "fel" 'counsel-find-library)


  ;; ;; Profiler bindings
  ;; (defun profiler-start-cpu ()
  ;;   (interactive)
  ;;   (profiler-start 'cpu))
  ;; (spacemacs/set-leader-keys "ops" 'profiler-start-cpu)
  ;; (spacemacs/set-leader-keys "opr" 'profiler-report)
  ;; (spacemacs/set-leader-keys "opt" 'profiler-stop)
  ;; (spacemacs/set-leader-keys "opx" 'profiler-reset)
  ;; (spacemacs/set-leader-keys "oper" 'elp-results)

  ;; Bury buffers instead of killing them by default
  ;; (spacemacs/set-leader-keys "bd" 'bury-buffer)
  ;; (spacemacs/set-leader-keys "bk" 'spacemacs/kill-this-buffer)
  ;; (spacemacs/set-leader-keys "bK" 'spacemacs/kill-other-buffers)

  ;; Use C-j in place of C-x
  ;; (define-key key-translation-map "\C-j" "\C-x")

  ;; Word wrap in text buffers
  ;; (add-hook 'text-mode-hook 'auto-fill-mode)

  ;; Don't copy text to system clipboard while selecting it
  ;; (fset 'evil-visual-update-x-selection 'ignore)

  ;; Remap paste to be able to paste multiple times
  ;; If I don't like this, maybe I'll try this:
  ;; https://github.com/Dewdrops/evil-ReplaceWithRegister/
  ;; (defun evil-paste-after-from-0 ()
  ;;   (interactive)
  ;;   (let ((evil-this-register ?0))
  ;;     (call-interactively 'evil-paste-after)))

  ;; (define-key evil-visual-state-map "p" 'evil-paste-after-from-0)

  ;; (dotimes (n 6)
  ;;   (let ((n (+ n 2)))
  ;;     ;; Map s-<number> to switch layouts
  ;;     (global-set-key (kbd (format "s-%d" n)) (intern (format "spacemacs/persp-switch-to-%d" n)))
  ;;     ;; Map M-<number> to workspace switching
  ;;     (let ((key (kbd (format "M-%d" n))))
  ;;       (define-key winum-keymap key nil)
  ;;       (global-unset-key key)
  ;;       (global-set-key key (intern (format "eyebrowse-switch-to-window-config-%d" n))))))
  ;; (global-set-key (kbd "s-1") 'aj/persp-org-agenda)
  ;; (global-set-key (kbd "s-8") 'spacemacs/custom-layouts-transient-state/spacemacs/custom-perspective-@Org-and-exit)
  ;; (global-set-key (kbd "s-9") 'spacemacs/custom-layouts-transient-state/spacemacs/custom-perspective-@Spacemacs-and-exit)

  ;; ;; Prevent font size changes from resizing frame
  ;; (setq frame-inhibit-implied-resize t)
  ;; ;; Change entire frame font size
  ;; (defun my-alter-frame-font-size (fn)
  ;;   (let* ((current-font-name (frame-parameter nil 'font))
  ;;          (decomposed-font-name (x-decompose-font-name current-font-name))
  ;;          (font-size (string-to-number (aref decomposed-font-name 5))))
  ;;     (aset decomposed-font-name 5 (int-to-string (funcall fn font-size)))
  ;;     (set-frame-font (x-compose-font-name decomposed-font-name))))

  ;; (defun my-inc-frame-font-size ()
  ;;   (interactive)
  ;;   (my-alter-frame-font-size '1+))

  ;; (defun my-dec-frame-font-size ()
  ;;   (interactive)
  ;;   (my-alter-frame-font-size '1-))

  ;; (global-set-key (kbd "s-+") 'my-inc-frame-font-size)
  ;; (global-set-key (kbd "s-=") 'my-inc-frame-font-size)
  ;; (global-set-key (kbd "s--") 'my-dec-frame-font-size)
  ;; (global-set-key (kbd "C-+") 'spacemacs/scale-up-font)
  ;; (global-set-key (kbd "C-=") 'spacemacs/scale-up-font)
  ;; (global-set-key (kbd "C--") 'spacemacs/scale-down-font)

  ;; (setq completing-read-function 'ivy-completing-read)

  ;; Ivy isn't great for renaming files, so let's try using the default function
  ;; (defun aj/use-completing-read-default (orig-fun &rest args)
  ;;   (let ((completing-read-function 'completing-read-default))
  ;;     (apply orig-fun args)))
  ;; (advice-add 'spacemacs/rename-current-buffer-file :around 'aj/use-completing-read-default)

  ;; Remove binding to open font panel
  ;; (global-unset-key (kbd "s-t"))

  ;; Pairing stuff
  ;; (global-set-key (kbd "<end>") 'evil-end-of-line)

  ;; load private settings
  (when (file-exists-p "~/.emacs-private.el")
    (load-file "~/.emacs-private.el"))


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg caml toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme reason-mode rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme ob-elixir noctilux-theme nginx-mode neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme launchctl key-chord js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-mix flycheck-flow flycheck-credo flycheck flx-ido flow-minor-mode flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help erlang emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat django-theme dired-collapse dired-hacks-utils diminish darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-flx flx company-flow company-emoji company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f ample-zen-theme ample-theme alect-themes alchemist s company dash elixir-mode pkg-info epl aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
