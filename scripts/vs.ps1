# Script vs.ps1
# Utilização: `$ vs`
# Função: Busca o primeiro arquivo .sln do repositório atual e abre-o no Visual Studio
#         A variável $vs_path deve ser alterada para o diretório da sua instalação do VS
#         Ou opcionalmente ela pode ser omitida se o devenv.exe estiver no PATH do sistema

$vs_path = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe"
$sln_name = gci .\* -Include "*.sln", "*.csproj" `
	| Sort-Object -Descending -Property Extension `
	| Select-Object -First 1 `
	| ForEach-Object { "$($_.BaseName)$($_.Extension)" }

start $vs_path $sln_name
