# Defina a lista de programas a serem desinstalados
$programsToUninstall = @("Programa 1", "Programa 2", "Programa 3")

# Iterar pela lista de programas
foreach ($programName in $programsToUninstall) {
    # Tente encontrar o programa usando Win32_Product
    $program = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $programName }
    
    if ($program) {
        # Se o programa foi encontrado, tente desinstalá-lo
        $result = $program.Uninstall()
        
        # Verifique o resultado da desinstalação
        if ($result.ReturnValue -eq 0) {
            Write-Output "$programName desinstalado com sucesso."
        } else {
            Write-Output "Falha ao desinstalar $programName. Código de retorno: $($result.ReturnValue)"
        }
    } else {
        Write-Output "Programa '$programName' não encontrado."
    }
}
