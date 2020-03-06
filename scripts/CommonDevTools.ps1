
# tools we expect devs across many scenarios will want
choco install -y microsoft-windows-terminal
Update-SessionEnvironment
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
Update-SessionEnvironment
choco install -y git-fork
choco install -y vscode
choco install -y winmerge
choco install -y linqpad5
