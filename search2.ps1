clear

$keyword='tumblr'

[System.Console]::WriteLine('Please input the key word:')
$keyword = Read-Host

[string[]]$td='d','e','f'
[String[]]$td_strs=@{}

Foreach($c in $td)
{
    $td_strs+=$c+':\'
}

Foreach($td_path in $td_strs)
{
    $td_sub_files=@{}

    try { $td_sub_files=[System.IO.Directory]::GetFiles($td_path) }
    catch { continue }

    Foreach($td_sub_file in $td_sub_files)
    {
        if(([string]$td_sub_file).ToLower().Contains($keyword)) 
        { $td_sub_file } 
    }

    $td_sub_dirs=[System.IO.Directory]::GetDirectories($td_path)

    Foreach($td_sub_dir in $td_sub_dirs)
    {
        $td_sub2_files=@{}
        
        try { $td_sub2_files=[System.IO.Directory]::GetFiles($td_sub_dir)}
        catch {continue}

        Foreach($td_sub2_file in $td_sub2_files)
        {
            if(([string]$td_sub2_file).ToLower().Contains($keyword)) 
            { $td_sub2_file } 
        }
    }
}