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
	
And pull in evil:

	$ cd ~/.emacs.d && git submodule init && git submodule update

What's Inside?!
------------------------------------------------------------------------

My own personal settings, tuned to be super rad. Also, some plugins:

* [evil-mode](https://gitorious.org/evil/pages/Home)
* [color-theme](http://www.nongnu.org/color-theme)
* [markdown-mode](http://jblevins.org/projects/markdown-mode/)
* [paredit](http://www.emacswiki.org/emacs/ParEdit)
* [rainbow-delimiters](http://www.emacswiki.org/emacs/RainbowDelimiters)
* [SLIME](http://common-lisp.net/project/slime)

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
