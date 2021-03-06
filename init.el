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
     terraform
     csv
     spell-checking
     reasonml
     (python :variables
      python-formatter 'black
      python-format-on-save nil
      python-test-runner 'pytest
      python-lsp-server 'mspyls
      )

     sphinx
     (markdown :variables markdown-live-preview-engine 'vmd)
     (lsp :variables
      ;; lsp-navigation 'simple
      ;; lsp-ui-doc-enable nil
      ;; lsp-clients-go-gocode-completion-enabled nil
      lsp-clients-go-server 'gopls
      )

     (go :variables
         go-backend 'lsp
         godoc-at-point-function 'godoc-gogetdoc
         go-use-golangci-lint t
         go-format-before-save t
         )
     ;; (reasonml :variables
     ;;           reason-auto-refmt t)

     multiple-cursors
     node
     ;; better-defaults
     emacs-lisp
     git
     ivy
     ;; helm
     (shell :variables
            shell-default-shell 'vterm
            ;; shell-default-width 30
            ;; shell-default-position 'right
            )
     shell-scripts
     syntax-checking
     auto-completion
     ;; lsp-ui
     ;; lsp-treemacs

     (javascript :variables
                 ;; javascript-backend 'lsp
                 js2-mode-show-strict-warnings nil
                 js2-mode-show-parse-errors nil
                 node-add-modules-path t)
     (typescript :variables
                 typescript-backend 'tide
                 node-add-modules-path t)
     (treemacs :variables
               treemacs-lock-width t)
     ;; (org :variables org-enable-github-support t)
     version-control
     themes-megapack
     json
     emoji
     colors
     osx
     yaml
     react
     prettier
     html)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      eslintd-fix
                                      ;; minimap
                                      ;; flycheck-flow
                                      flow-js2-mode
                                      ;; elisp-format
                                      key-chord)
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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default spacemacs-27.1.pdmp)
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

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

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-city-lights
                         atom-one-dark
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
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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
   ;; Use to disable fullscreen animations in OSX. ((default nil))
   dotspacemacs-fullscreen-use-non-native t

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 65

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

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
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

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
   dotspacemacs-frame-title-format "%I@%z"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode nil

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
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (use-package vterm
    :ensure t)

  (require 'lsp-go)
  ;; http://blog.binchen.org/posts/how-to-speed-up-lsp-mode.html
  (with-eval-after-load 'lsp-mode
    ;; enable log only for debug
    (setq lsp-log-io nil)

    ;; use `evil-matchit' instead
    (setq lsp-enable-folding nil)

    ;; no real time syntax check
    (setq lsp-diagnostic-package :none)

    ;; handle yasnippet by myself
    (setq lsp-enable-snippet nil)

    ;; use `company-ctags' only.
    ;; Please note `company-lsp' is automatically enabled if installed
    ;; (setq lsp-enable-completion-at-point nil)

    ;; turn off for better performance
    (setq lsp-enable-symbol-highlighting nil)

    ;; use ffip instead
    (setq lsp-enable-links nil)

    ;; auto restart lsp
    (setq lsp-restart 'auto-restart)

    ;; @see https://github.com/emacs-lsp/lsp-mode/pull/1498 and code related to auto configure.
    ;; Require clients could be slow.
    ;; I only load `lsp-clients' because it includes the js client which I'm interested
    (setq lsp-client-packages '(lsp-clients))

    ;; don't scan 3rd party javascript libraries
    ;; (push "[/\\\\][^/\\\\]*\\.\\(json\\|html\\|jade\\)$" lsp-file-watch-ignored) ; json

    ;; don't ping LSP lanaguage server too frequently
    (defvar lsp-on-touch-time 0)
    ;; (defadvice lsp-on-change (around lsp-on-change-hack activate)
    ;;   ;; don't run `lsp-on-change' too frequently
    ;;   (when (> (- (float-time (current-time))
    ;;               lsp-on-touch-time) 30) ;; 30 seconds
    ;;     (setq lsp-on-touch-time (float-time (current-time)))
    ;;     ad-do-it))
    )

  ;; (defun my-connect-lsp (&optional no-reconnect)
  ;;   "Connect lsp server.  If NO-RECONNECT is t, don't shutdown existing lsp connection."
  ;;   (interactive "P")
  ;;   (when (and (not no-reconnect)
  ;;              (fboundp 'lsp-disconnect))
  ;;     (lsp-disconnect))
  ;;   (when (and buffer-file-name
  ;;              (not (member (file-name-extension buffer-file-name)
  ;;                           '("json"))))
  ;;     (unless (and (boundp 'lsp-mode) lsp-mode)
  ;;       (if (derived-mode-p 'js2-mode) (setq-local lsp-enable-imenu nil))
  ;;       (lsp-deferred))))
  (fset 'setup-ml-tools
    (kmacro-lambda-form [?  ?T ?F ?  ?f ?t return ?\C-n ?\C-n ?\C-n ?\C-n return ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n return ?\C-n ?\C-n ?\C-n return ?\C-n ?\C-n ?\C-n ?\C-n return ?  ?p ?\' ?j ?k ?j ?k ?j ?k ?f ?d ?  ?w ?L ?  ?g ?s ?  ?1 ?  ?m ?v ?p ?a ?  ?g ?s ?  ?1] 0 "%d"))

  ;; (eval-after-load "org"
  ;;   '(require 'ox-gfm nil t))

  ;; (add-hook 'find-file-hook 'linum-mode)
  ;; This prevents the inferior python shell from outputing weird byte strings.
  ;; [TODO] or does it?
  (with-eval-after-load 'python
    (add-to-list 'python-shell-completion-native-disabled-interpreters "python"))

  (setq create-lockfiles nil)

  ;; [TODO] not sure if this is working.
  (setq require-final-newline t)

  ;; (add-hook 'javascript-mode-hook 'eslintd-fix-mode)
  ;; (eslintd-fix :toggle javascript-eslint-fix-on-save)

  ;; (add-hook 'focus-out-hook 'garbage-collect)

  ;; (setq flycheck-idle-change-delay 4.0)
  (setq flycheck-check-syntax-automatically '(mode-enable save))
  ;; (setq flycheck-idle-buffer-switch-delay 4.0)

  ;; (require 'minimap)
  ;; (setq minimap-window-location 'right)
  ;; (setq minimap-minimum-width 14)
  ;; (setq minimap-width-fraction 0.01)
  ;; (setq minimap-automatically-delete-window nil)
  ;; (setq minimap-recreate-window nil)

  ;; (setq default-frame-alist '((font . "Source Code Pro Medium-14")
  ;;                             (fullscreen . fullboth)
  ;;                             (fullscreen-restore . fullheight))) ;; set default font for emacs --daemon / emacsclient
  ;; (require 'flycheck-flow)
  ;; (eval-after-load 'flycheck
  ;;   '(flycheck-add-mode 'html-tidy 'web-mode))

  ;; TODO verify current situation.
  ;; ;; https://github.com/flycheck/flycheck/issues/1472#issuecomment-396058812
  ;; (eval-after-load 'flycheck
  ;;   '(setcar (memq 'source-inplace (flycheck-checker-get 'typescript-tslint 'command)) 'source-original))
  ;; (setq node-add-modules-path t)
  ;; (eval-after-load 'typescript-jsx-mode
  ;;   '(progn
  ;;      (add-hook 'typescript-jsx-mode-hook #'add-node-modules-path)
  ;;      (add-hook 'typescript-jsx-mode-hook #'prettier-js-mode)))

  ;; If you want to paste the same value in kill ring multiple times you have to prevent the
  ;; behavior kill-on-visual-paste which will add the deleted word to the kill ring.
  (setq-default evil-kill-on-visual-paste nil)


  ;; TODO verify current behavior
  ;; https://github.com/syl20bnr/spacemacs/issues/8206#issuecomment-392347981
  ;; (defun rjsx-hybrid-keybindings ()
  ;;   "Bind C-d to `rjsx-delete-creates-full-tag'."
  ;;   (if (bound-and-true-p evil-hybrid-state-map)
  ;;       (define-key evil-hybrid-state-map (kbd "C-d") #'rjsx-delete-creates-full-tag)
  ;;     (error "Failed defining RJSX hybrid state keybindings")))
  ;; (add-hook 'rjsx-mode-hook #'rjsx-hybrid-keybindings)

  ;; TODO is this still needed; could be creating conflicts.
  ;; https://stackoverflow.com/questions/36719386/spacemacs-set-tab-width
  (defun my-setup-indent (n)
    ;; java/c/c++
    ;; (setq c-basic-offset n)
    ;; web development
    ;; (setq javascript-indent-level n) ; javascript-mode
    (setq js-indent-level n) ; js-mode
    ;; (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset n) ; web-mode, css in html file
    (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
    (setq css-indent-offset n) ; css-mode
    ;; (setq rjsx-mode-indent-level n) ; typescript
    (setq typescript-indent-level n) ; typescript)
    (setq typescript-tsx-indent-level n) ; typescript)
    (setq reason-indent-offset n)
    )
  (my-setup-indent 2) ; indent 2 spaces width


  ;; (setq-default js2-mode-show-parse-errors nil)
  ;; (setq-default js2-mode-show-strict-warnings nil)

  ;; (require 'elisp-format)
  ;; (add-hook 'typescript-mode-hook 'flycheck-mode)
  ;; (add-hook 'javascript-mode-hook 'flycheck-mode)
  ;; (add-hook 'typescript-tsx-mode-hook 'lsp-typescript-enable)

  (defun save-all ()
    (interactive)
    (save-some-buffers t))

  (add-hook 'focus-out-hook 'save-all)

  (define-key evil-normal-state-map (kbd "SPC o") 'flycheck-mode)

  (defun go-to-dashboard ()
    (interactive)
    (find-file "~/clm-dashboard.org"))

  (define-key evil-normal-state-map (kbd "SPC b c") 'go-to-dashboard)

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

  (global-set-key (kbd "M-{") 'insert-pair)
  (global-set-key (kbd "M-[") 'insert-pair)
  (global-set-key (kbd "M-\"") 'insert-pair)
  (global-set-key (kbd "M-'") 'insert-pair)
  (global-set-key (kbd "M-(") 'insert-pair)
  ;; TODO doesn't work result has single quote at end like `word'
  (global-set-key (kbd "M-`") 'insert-pair)
  (global-set-key (kbd "M-<") 'insert-pair)
  (global-set-key (kbd "M-)") 'delete-pair)

  ;; (require 'multiple-cursors)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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
 '(counsel-rg-base-command
   '("rg" "--vimgrep" "--with-filename" "--no-heading" "--line-number" "--smart-case" "%s"))
 '(evil-escape-excluded-major-modes '(treemacs-mode))
 '(evil-undo-system nil)
 '(evil-want-Y-yank-to-eol nil)
 '(gofmt-show-errors 'echo)
 '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(linum-format " %3i ")
 '(lsp-python-ms-extra-paths ["./source" "./src" "./" "../"])
 '(package-selected-packages
   '(toml-mode ron-mode racer flycheck-rust cargo rust-mode csv-mode tern evil-mc vmd-mode mmm-mode markdown-toc markdown-mode gh-md ox-gfm yapfify stickyfunc-enhance pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements lsp-python-ms live-py-mode ctable concurrent deferred helm-pydoc helm-gtags helm-cscope xcscope ggtags dap-mode bui cython-mode counsel-gtags company-anaconda blacken anaconda-mode pythonic zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode ws-butler writeroom-mode winum white-sand-theme which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode seti-theme scss-mode sass-mode rjsx-mode reverse-theme reveal-in-osx-finder restart-emacs request rebecca-theme reason-mode rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard organic-green-theme org-superstar open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme nodejs-repl noctilux-theme naquadah-theme nameless mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme modus-vivendi-theme modus-operandi-theme minimal-theme material-theme majapahit-theme magit-svn magit-section magit-gitflow madhat2r-theme macrostep lush-theme lsp-ui lsp-treemacs lsp-ivy lorem-ipsum livid-mode link-hint light-soap-theme launchctl key-chord kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ir-black-theme insert-shebang inkpot-theme indent-guide impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-make hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-ocaml flycheck-golangci-lint flycheck-elsa flycheck-bashate flx-ido flow-js2-mode flatui-theme flatland-theme fish-mode farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eslintd-fix emr emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig dune dumb-jump dracula-theme dotenv-mode doom-themes django-theme diminish devdocs darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme counsel-projectile counsel-css company-web company-shell company-go company-emoji column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode clues-theme chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme browse-at-remote birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile atom-one-dark-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme add-node-modules-path ace-link ac-ispell))
 '(pos-tip-background-color "#222225")
 '(pos-tip-foreground-color "#c8c8d0")
 '(pytest-cmd-format-string "cd '%s' && pipenv run %s %s '%s'")
 '(python-shell-extra-pythonpaths nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
