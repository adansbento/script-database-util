#!/bin/bash

# Verifique se o arquivo script.json existe
if [[ ! -f script.json ]]; then
echo "Arquivo script.json não encontrado."
echo "ex.: "
echo "[ "
echo "  {"
echo "    "description": "Lista todos usuarios ativos", "
echo "    "category": "cat1", "
echo "    "script": "script1" "
echo "   },"
echo "  { "
echo "    "description": "desc2", "
echo "    "category": "cat2", "
echo "    "script": "script2" "
echo "  } "
echo "] "
  exit 1
fi

# Verifique se o jq está instalado
if ! command -v jq > /dev/null; then
  echo "jq não está instalado. Por favor, instale primeiro."
  echo "sudo apt install jq"
  exit 1
fi


# Função para copiar para a área de transferência que detecta o sistema operacional
copy_to_clipboard() {
  case $(uname) in
    Linux*)  echo -n "$1" | clip.exe ;;
    Darwin*) echo -n "$1" | pbcopy ;;
    CYGWIN*) echo -n "$1" >/dev/clipboard ;;
    MINGW*)  echo -n "$1" >/dev/clipboard ;;
    *)       return 1 ;;
  esac
}
echo 'Selecione a categoria:'
# Ler o arquivo JSON e montar o menu
mapfile -t categories < <(jq -r '.[] | .category' script.json | sort -u)

select category in "${categories[@]}"; do
echo 'Selecione a script:'
  mapfile -t descriptions < <(jq -r --arg category "$category" '.[] | select(.category==$category) | .description' script.json)
  
  select description in "${descriptions[@]}"; do
    script=$(jq -r --arg category "$category" --arg description "$description" '.[] | select(.category==$category and .description==$description) | .script' script.json)

    echo "Você selecionou: $category > $description"
    echo "Script correspondente: $script"

    if copy_to_clipboard "$script"; then
      echo "O script foi copiado para a área de transferência com sucesso."
    else
      echo "Falha ao copiar script para a área de transferência."
    fi

    break 2

  done

done