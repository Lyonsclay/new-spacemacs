This is my personal spacemacs config but I am interested in optimizing the config to share more widely.

* [ ] One of the issues with adopting spacemacs is the massive api and infintely configurable nature. I want to produce a formula that works for common web developement scenarios.
* Languages
  * javascript
  * typescipt
  * flow
  * reasonml
  * gocode
  * python

### Themes
In emacs themse set the colors and styling of the text and layout. I have include the megapack layer which has a boat load of themes to choose from.

#### Upgrade process
 Another difficulty of spacemacs is the upgrade process. You have to manually go through a diff file when you pull from the spacemacs repo. Is that a big deal? If you update frequently it can be a challenge to try and interpret your intential changes to the config file versus default settings. While I could be more active with this process I think it is a significant barrier to entry when compared with vs code.
* the challenge is incorporating user defined configs with an evolving code base
* It would be nice if you could define your stuff in a seperate file form the default setup in init.e.
* What should happen to settings that you have configed but get dropped from the core init.el on an upgrade?
  * proposal - anything that was not user set, i.e. the setting is in the default state will just get removed on updgrade.
  * proposal - anything that was set will be added to user-config, but commented out at the very top of that function body

#### Getting setup
* make a git repo for your init.el or entire .spacemacs.d directory
* add a .gitignore file with `.spacemacs.env` as the first line
* spacemacs creates a `.spacemacs.env` file that is aggregated from various config files on your local machine that may potentially have secrets.
* everytime you make a change to your init.el file or any imported code make a git commit with a clear message


#### Debugging Spacemacs
#### Quick Tips
* Do you ever find you have pressed some keys that did something unexpected?
  * C-h l
* Do you want to code fold html tags?
  * SPC m z
* folds and unfolds!
  * z m (close)
  * z r (open**
* visit link at point
  * SPC x o
* How to get help; starts with prefix SPC h
  * SPC h d (option) -- logs response to *Messages* buffer - accesible at SPC b m
* describe-system-info good for debugging and making issues
  * SPC h d s
* What was that last key combo you entered that did something unexpected?
  * SPC h d l
* And for the coolest tip :: switch color theme without exiting the minibuffer
  * SPC T s -- open counsel-load-theme
  * C-n, C-p -- navigate up and down
  * C-M n -- select theme without exiting minibuffer
* Change font-size on the fly -- current buffer only
  * SPC z c [+/-]
* Change global font
  * SPC SPC menu-set-font -- will open system fonts selector

### Shell Layer
* Install vterm; it's a must have if you want to have real(meaning fast) experience.
* On osx Catalina you will need to enable Full Disk Access for ability to see user folders -- https://emacs.stackexchange.com/a/53037
* I use hybrid mode which enables the normal C-p/C-n previous next entry navigation and C-r for command look up.
