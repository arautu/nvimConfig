# nvimConfig

Configurações para o editor de texto neovim ≥ 0.12.

## Plugins

Esta configuração é baseada na ferramenta nativa de pacotes vim.pack [https://neovim.io/doc/user/pack/].

### Atualização de plugins

O comando abaixo atualiza todos os plugins.

```
:lua vim.pack.update()
:restart
```

### Instalação de plugin

Os comandos para instalação de plugins estão espalhados nos arquivos de configuração dos respectivos plugins, portanto, os plugins para funcionamento do telescope estão no arquivo telescope.lua


### Remover plugin 

Após remover do arquivo de plugin a instrução: `vim.pack.add(<plugin>)`, 
Lance o comando:

```
:lua vim.pack.del(<plugin>)
```

## Tree-sitter

Para saber quais linguagens são atendidas pelo tree-sitter, consulte em: [https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md].
A instalação e desintalação de analisadores (parsers) de linguagem devem ser feitas manualmente, com os comandos:
```
:TSInstall <linguagem>`
:TSUninstall <linguagem>`
```
Ou pode-se instalar pelo arquivo em 'lua/plugins/treesitter.lua'.

### Hooks
Foi criado um gancho (hook) de maneira que ao atualizar os plugins, os analisadores também são atualizados. O hook se encontra no próprio treesitter.lua.

## Teclas de atalho

### Dobramento de código (Fold)

zM	Fecha todos os folds do arquivo
zR	Abre todos os folds
za	Alterna (abrir/fechar) o bloco atual


