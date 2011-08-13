<img src="https://raw.github.com/csexton/viceroy/master/viceroy/logo.png" align="right" />

Viceroy is a configuration of the [Vim text editor](http://www.vim.org/). It is a set of Vim scripts that help programmers get the most out of Vim with common options that advanced vim users would set.

Who is this for? Teams that want a standard vim configuration to share, particularly for pair programming. People just getting started with vim and want to boot-strap their configuration. And anyone who just wants the batteries included with Vim.

Viceroy is not intended to be a crutch that experienced vim users would get annoyed at. Yes, it is opinionated, but tries to follow best practices of the community. The goal is to have a solid set a defaults with an easy way to customize. If you think something should be changed please submit a pull request. Together we can make this project a rock solid base for writing code in Vim.

To install simply run this command (if you trust me, otherwise clone the [git repo](http://github.com/csexton/viceroy)):

    $ curl -L https://raw.github.com/csexton/viceroy/master/bootstrap.sh -o - | sh

Included are a set of plugin bundles that really unleash the power of Vim. They are not installed by default, but can easily be downloaded and installed by running this command in Vim:

    :InstallBundles

Local customization is easy. If you want to change your color scheme, or override any of the settings in Viceroy, edit your `.vimrc.local` file. This is also the place to specify any additional plugin bundles that you want to install.

You can edit it by running this command:

    $ vim ~/.vimrc.local

Here an example `.vimrc.local`:

    set nofoldenable
    set guifont=Monaco:h14
    silent! colorscheme solarized

Since Viceroy uses pathogen under the covers, adding additional plugins is easy. Just clone the repo into `~/.vim/bundle`.

Here an example `.vim-bundles`:

    # Repos on github
    csexton/jekyll.vim
    tpope/vim-fugitive

    # Vim Scripts repos
    # See https://github.com/vim-scripts for a list of the mirrored projects
    L9
    rails.vim

    # Arbitrary git repos
    git://git.wincent.com/command-t.git

    # If you don't want to use of the the default plugins, you
    # can skip it by prefixing the line with a `~`
    ~jslint.vim
    ~gist-vim

The default bundles are listed in Viceroy's [Bundlefile](https://github.com/csexton/viceroy/blob/master/Bundlefile).

This is supposed to be a community driven project. If you have suggestions or changes please add an [issue](https://github.com/csexton/viceroy/issues), check the [wiki](https://github.com/csexton/viceroy/wiki) or best of all a [pull request](https://github.com/csexton/viceroy/pulls).
