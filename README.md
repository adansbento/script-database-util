  # Shell Script Gerar Consultas SQL

Este shell script processa um arquivo JSON chamado script.json e apresenta um menu interativo para o usuário, que pode selecionar categorias e descrições de script, copiando a string de script selecionada para a área de transferência.
Os campos description, category, e script do arquivo JSON são usados para montar o menu!

# Pré-Requisitos
jq : Essa é uma ferramenta leve e flexível para manipular JSON na linha de comando. Esta ferramenta é utilizada para extrair as informações do arquivo JSON. Certifique-se de ter jq instalado no seu sistema.
clipboard utility : Esta ferramenta é usada para copiar o conteúdo para a área de transferência. Para o Linux, você precisará do xclip. No MacOS, o pbcopy deve estar disponível por padrão. No Windows (com Cygwin ou Git Bash), a área de transferência é diretamente acessível.

# Instruções de Uso
Certifique-se de que o arquivo script.json exista no mesmo diretório que este shell script.
Execute o script com o comando bash

    ./your-shell-script.sh.
    
O script apresentará um menu listando as categorias disponíveis no arquivo script.json. Insira o número correspondente à categoria que você deseja selecionar e pressione Enter.
Após selecionar uma categoria, um novo menu com as descrições correspondentes à categoria selecionada será apresentado. Insira o número correspondente à descrição que deseja selecionar e pressione Enter.
O script correspondente à descrição selecionada será exibido e também copiado para a área de transferência.

# Exemplo de arquivo JSON
Aqui está um exemplo de como o arquivo script.json deve ser:

    {
      "description": "description value",
      "category": "category value",
      "script": "script value"
    }
