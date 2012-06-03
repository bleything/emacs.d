Ben Bleything's .emacs.d
========================================================================

This repo is my real `.emacs.d`. It should be noted that I'm not really
an emacs guy, but I've been trying to maintain competency for some time.

This setup is based on the work of many others, and you should check the
Credits section below for more details.

Installation
------------------------------------------------------------------------

Pretty straightforward. Just clone:

    $ git clone git://github.com/bleything/dotemacs.git ~/.emacs.d

If you want, you can create a `~/.emacs.d/secrets.el.gpg` file that'll be loaded
at startup.

What's Inside?!
------------------------------------------------------------------------

My own personal settings, tuned to be super rad. Also, some plugins:

* [ack-and-a-half](https://github.com/jhelwig/ack-and-a-half)
* [color-theme](http://www.nongnu.org/color-theme)
* [inf-ruby](https://github.com/nonsequitur/inf-ruby)
* [magit](http://philjackson.github.com/magit/)
* [paredit](http://www.emacswiki.org/emacs/ParEdit)
* [rainbow-delimiters](http://www.emacswiki.org/emacs/RainbowDelimiters)
* [rainbow-mode](http://julien.danjou.info/software/rainbow-mode)
* [rvm](https://github.com/senny/rvm.el)
* [SLIME](http://common-lisp.net/project/slime)
* [switch-window](https://github.com/dimitri/switch-window)

Also, some syntax definitions:

* [clojure-mode](http://github.com/technomancy/clojure-mode)
* [io-mode](http://www.alcyone.com/software/io-mode/)
* [markdown-mode](http://jblevins.org/projects/markdown-mode/)
* [prolog-mode](http://www.emacswiki.org/emacs/PrologMode)
* [ruby-mode](http://www.emacswiki.org/emacs/RubyMode)
* [scss-mode](https://github.com/antonj/scss-mode)
* [yaml-mode](https://github.com/yoshiki/yaml-mode)

Also, some color themes, some with slight modifications by me:

* [Railscasts](https://github.com/olegshaldybin/color-theme-railscasts)
* [Twilight](https://github.com/crafterm/twilight-emacs)
* [Tomorrow Night](https://github.com/ChrisKempson/Tomorrow-Theme)

Credits
------------------------------------------------------------------------

* [Phil Hagelberg][0], from whose [Emacs Starter Kit][1] I've cribbed
  extensively
* The authors of the plugins, modules, and themes listed above

[0]: http://technomancy.us
[1]: http://github.com/technomancy/emacs-starter-kit

Copyright and License
------------------------------------------------------------------------

I don't believe in copyrighting configs. However, some of the scripts and
plugins and whatnot may be copyrighted; see those files for details.
