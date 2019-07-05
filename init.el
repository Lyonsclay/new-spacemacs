
;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
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
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; dotspacemacs-editing-style '(hybrid :variables
   ;;                                     hybrid-mode-default-state 'normal
   ;;                                     hybrid-mode-enable-evilified-state t
   ;;                                     hybrid-mode-enable-hjkl-bindings nil)
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
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
   ;; dotspacemacs-default-font '("SF Mono for Powerline"
   ;; dotspacemacs-default-font '("Source Code Pro"
   dotspacemacs-default-font '("Source Code Pro for Powerline Medium"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
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

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   dotspacemacs-smart-closing-parenthesis nil

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%m :: %f"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

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
  (with-eval-after-load 'company
    (company-flx-mode +1))

  ;; Speed up autocomplete popup
  (setq company-idle-delay 0.1)

  ;; (setq message-send-mail-function 'smtpmail-send-it)
  (setq message-kill-buffer-on-exit t)

  (add-hook 'before-make-frame-hook
            (lambda ()
              (unless window-system
                (menu-bar-mode -1))))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
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
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#003f8e" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#ffffff"))
 '(beacon-color "#ff9da4")
 '(custom-safe-themes
   (quote
    ("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#003f8e")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(highlight-symbol-colors
   (quote
    ("#EFFF00" "#73CD4F" "#83DDFF" "MediumPurple1" "#66CDAA" "DarkOrange" "HotPink1" "#809FFF" "#ADFF2F")))
 '(hl-paren-background-colors
   (quote
    ("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC" "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00")))
 '(hl-paren-colors (quote ("#326B6B")))
 '(js-indent-level 2)
 '(org-src-block-faces (quote (("emacs-lisp" (:background "#F0FFF0")))))
 '(package-selected-packages
   (quote
    (helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-gometalinter flycheck-golangci-lint counsel-gtags company-go go-mode flow-js2-mode yasnippet-snippets helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics company-flow company-emoji company-anaconda auto-yasnippet ac-ispell auto-complete yapfify yaml-mode xclip ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package tuareg treemacs-projectile treemacs-evil toc-org tagedit symon symbol-overlay string-inflection spaceline-all-the-icons smeargle slim-mode shift-number seti-theme scss-mode sass-mode rjsx-mode reveal-in-osx-finder restart-emacs reason-mode rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard org-gcal org-bullets open-junk-file ocp-indent ob-elixir nginx-mode naquadah-theme nameless move-text monokai-theme magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint launchctl json-navigator js2-refactor js-doc indent-guide importmagic impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helpful helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-ag gruvbox-theme graphviz-dot-mode google-translate golden-ratio gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist forge font-lock+ flycheck-pos-tip flycheck-package flycheck-ocaml flycheck-mix flycheck-flow flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-terminal-cursor-changer evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu erlang emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig dune dumb-jump dtrt-indent dotenv-mode doom-themes doom-modeline dockerfile-mode docker dired-collapse diminish diff-hl dakrone-theme cython-mode csv-mode counsel-projectile company-flx column-enforce-mode color-identifiers-mode clean-aindent-mode centered-cursor-mode browse-at-remote blacken auto-highlight-symbol auto-compile atom-one-dark-theme anaconda-mode alchemist aggressive-indent add-node-modules-path ace-link ace-jump-helm-line)))
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff9da4")
     (40 . "#ffc58f")
     (60 . "#ffeead")
     (80 . "#d1f1a9")
     (100 . "#99ffff")
     (120 . "#bbdaff")
     (140 . "#ebbbff")
     (160 . "#ff9da4")
     (180 . "#ffc58f")
     (200 . "#ffeead")
     (220 . "#d1f1a9")
     (240 . "#99ffff")
     (260 . "#bbdaff")
     (280 . "#ebbbff")
     (300 . "#ff9da4")
     (320 . "#ffc58f")
     (340 . "#ffeead")
     (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
