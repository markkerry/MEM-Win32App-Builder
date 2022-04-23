---
external help file: MEM-Win32App-Builder-help.xml
Module Name: MEM-Win32App-Builder
online version:
schema: 2.0.0
---

# New-MemWin32AppBuild

## SYNOPSIS
Creates a new folder structure for MEM Win32 app package

## SYNTAX

```
New-MemWin32AppBuild [-Name] <String> [-Path] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
After the new app directory is created, the template files from
within the module are copied.

## EXAMPLES

### EXAMPLE 1
```
New-MemWin32AppBuild -Name "App Name 1.0" -Path "C:\Apps"
```

## PARAMETERS

### -Name
Name of the application.
E.g.
"GoogleChrome" or "Google Chrome 90"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path of your local app packaging environment.
E.g.
"C:\Apps"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
