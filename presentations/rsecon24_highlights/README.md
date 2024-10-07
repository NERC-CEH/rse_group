# How to view this presentation

## I'm on my own computer

First, install Quarto from [quarto.org/docs/get-started](https://quarto.org/docs/get-started/).

Then run

```sh
quarto render presentation.qmd
```

and open the generated `.html` in your browser.

If you want a live preview while you make edits, use

```sh
quarto preview presentation.qmd
```

instead of `render`.

If you're using one of the supported editors (VSCode, JupyterLab, RStudio, Neovim) there are plugins that you can use instead of the CLI.


## I'm on my work laptop

Install Quarto from our favourite Software Centre.

I then install VSCode and the Quarto plugin, and then `Ctrl+Shift+P` followed by `Quarto: Preview`.

