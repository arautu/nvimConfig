# nvimConfig

Neste repositório encontra-se as minhas configurações para o editor de texto neovim ≥ 0.12. Ela caracteriza-se por ser simplista, poucos plugins com foco mais generalista.

## Clipboard

A configuração do clipboard considera que o sistema linux está rodando no WSL da microsoft. Caso seja apenas linux, remova completamente o parâmetro **vim.g.clipboard**.

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

Para saber quais linguagens são atendidas pelo tree-sitter, consulte em:
[https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md].

A instalação e desintalação de analisadores (parsers) de linguagem devem ser feitas manualmente, com os comandos:

```
:TSInstall <linguagem>
:TSUninstall <linguagem>
```
Ou pode-se instalar pelo arquivo em 'lua/plugins/treesitter.lua'.

### Hooks

Foi criado um gancho (hook) de maneira que ao atualizar os plugins, os analisadores também são atualizados. O hook se encontra no próprio treesitter.lua.

## Teclas de atalho

### Dobramento de código (Fold)

* `zM` Fecha todos os folds do arquivo
* `zR` Abre todos os folds
* `za` Alterna (abrir/fechar) o bloco atual

## Telescope

Esta configuração usa a extensão **telescope-fzf-native.nvim**, instalada pelo arquivo lua/plugins/telescope.lua. Esta extensão permite pesquisas do tipo:

* `.lua$` Termina com .lua.
* `'wild` Exatamente a palavra.
* `!fire` Não possui a palavra.

### Instalação

Embora o vim.pack baixe a extensão, é necessário a compilação manual, com o seguinte comando:

```
cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim/ && make
```

## Gerenciador de arquivos

Encontra-se instalado o gerenciador de arquivos Oil. Use as seguintes teclas de atalho para usá-lo:
`-`         Abre o gerenciador de arquivos em janela.
`<space>-`  Abre o gerenciador de arquivos em janela.

## LSP (Servidor de Linguagem)

Com os comandos padrão, é possível usar as funções de servidor de linguagem sem configuração adicional.

### Atalhos principais

* `gra`  Ações de correção (code actions)
* `grn`  Renomear símbolo
* `grr`  Buscar referências
* `grx`  Executar CodeLens
* `K`    Exibir documentação do item (hover)
* `<C-S>`   Informações dos parâmetros (signature help), no modo inserção
* `gx`   Abrir documentação externa (quando o servidor suporta)
* `C-x C-o` Complementação

### Navegação inteligente

* `gd`   Ir para definição (recomenda‑se usar `<C-]>` para maior compatibilidade)
* `gD`   Ir para declaração
* `gi`   Implementações
* `gr`   Referências (alternativa à janela de busca rápida)

### Ajustes visuais

`z=`
`suggestions`   Sugestões de correção ortográfica (quando disponível)
`[d` e `]d`   Navegar entre diagnósticos (erros, avisos)
`[e` e `]e`   Navegar entre erros
`[w` e `]w`   Navegar entre avisos

## Inteligência artificial

O CodeCompanion integra assistência de IA ao Neovim, oferecendo chat interativo, edição inline de código e automação de tarefas via workflows.

### Comandos úteis

```
:CodeCompanionChat
/file
/fork
`ga`
```
2. Para selecionar múltiplos arquivos, use <tab>.
3. Duplica a janela de contexto. Use '}' ou '{' para trocar de janela, ou <C-c> para fechá-la.
4. Escolher outro adaptador.

### Interação inline

1. Selecione as linhas do arquivo.
2. `:CodeCompanion`
3. Lance o prompt.
4. Se estiver pedindo uma edição, use  `g1`, `g2` ou `g3` para aceitar/rejeitar a sugestão.
5. `q` cancela a requisição

## O que falta:
* Instalação do config. Buscar o jeito usado no projeto kickstart.
* Comandos do lsp.
