<img src="https://raw.github.com/csexton/viceroy/master/viceroy/logo.png" align="right" />

# Viceroy - Vim Configuration Framework

Vceroy is a starter kit for the <a href="http://www.vim.org/">Vim text editor</a>. It is a set of vim scripts that help programmers get the most out of vim with common options that advanced vim users would set.

Viceroy is not a crutch that experienced vim users would get annoyed at. It is opinionated, but tries to follow best practices of the community. The goal is to have a solid set a defaults with an easy way to customize.

To install simply run this command (if you trust me, otherwise clone the [git repo](http://github.com/csexton/viceroy)):

    $ curl https://raw.github.com/csexton/viceroy/master/bootstrap.sh -o - | sh

Included are a set of plugin bundles that really unleash the power of Vim. They are not installed by default, but can easily be downloaded and installed by running this command in vim:

    :BundleInit

Local customization is easy. If you want to change your color scheme, or override any of the settings in Viceroy, edit the .vimrc.local file. This is also the place to specify any additional plugin bundles that you want to install

    " Customizations go in ~/.vimrc.local
    colorscheme solarized
    set nofoldenable
    set guifont=Anonymous\ Pro:h16,Monaco:h16
    Bundle 'snipMate'

Since Viceroy uses vundle under the covers, adding additional plugins is easy.  Vundle even provides a slick interactive browser that you can use to install bundles

    :Bundles

If you want to exclude any of the default bundles that Viceroy installs, they can be removed by adding the following to your .vimrc.local file:

    let g:viceroy_skip_bundlename=1

Often annoyed by the process of setting up vim myself and helping get people setup I have thought I would create a better way to get vim to a sensible starting point.
