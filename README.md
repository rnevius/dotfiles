# neovim.conf

Personal neovim installation and configuration instructions to hedge against the fallout from a Macbook explosion.

## Installing

1. Install `neovim` and [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) with Homebrew:
    ```
    brew install neovim the_silver_searcher
    ```
2. Make sure that Python 3 is installed and add the `neovim` package for both 2/3:
    ```
    $ pip2 install --user neovim && pip3 install --user neovim
    ```
3. Install [vim-plug](https://github.com/junegunn/vim-plug):
    ```
    $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
4. Clone the `init.vim` file from this repo:
    ```
    $ curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/rnevius/neovim.conf/master/init.vim
    ```
5. Start `nvim` and install plugins via `:PlugInstall`
