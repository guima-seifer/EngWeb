Para gerar páginas de forma numerada é necessário ter em consideração que as variáveis no ambiente XSLV são imutáveis. Para conseguir associar uma página html a uma entrada "//doc" associa-se a variável à position() do "doc" na árvore xml. Esta associação está embrulhada num elemento <xsl:for-each> que permite aplicar o mesmo template a todos os nós selecionados.


Abrir o terminal na diretoria "/homework"
Primeiramente deve-se executar o servidor nodejs com o comando "node servidor.js&"
Abrir o browser e indicar o seguinte endereço, "localhost:7777/XXX" em que XXX corresponde a um valor entre 1 e 448 - corresponde ao número de páginas html geradas para o nosso website;
