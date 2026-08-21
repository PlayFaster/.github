# PSScriptAnalyzer settings for host-tooling PowerShell scripts.
# Deployed to each host repo's .validate/ by sync_projects.ps1 (Sync-HostRepo, Pass 2).
# Keeps default rule set + opt-in formatting rules; PSAvoidUsingWriteHost excluded for CLI output.
# (Note: format task passes -ExcludeRule PSUseSingularNouns,PSUseApprovedVerbs; see host_tooling_process.md).
@{
    ExcludeRules = @(
        'PSAvoidUsingWriteHost'
    )
    Rules        = @{
        # --- Code formatting (full reflow) ---
        PSPlaceOpenBrace           = @{
            Enable             = $true
            OnSameLine         = $true
            NewLineAfter       = $true
            IgnoreOneLineBlock = $true
        }
        PSPlaceCloseBrace          = @{
            Enable             = $true
            NewLineAfter       = $false
            IgnoreOneLineBlock = $true
            NoEmptyLineBefore  = $false
        }
        PSUseConsistentIndentation = @{
            Enable              = $true
            Kind                = 'space'
            IndentationSize     = 4
            PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
        }
        PSUseConsistentWhitespace  = @{
            Enable          = $true
            CheckInnerBrace = $true
            CheckOpenBrace  = $true
            CheckOpenParen  = $true
            CheckOperator   = $true
            CheckPipe       = $true
            CheckSeparator  = $true
            CheckParameter  = $false
        }
        # PSAlignAssignmentStatement is intentionally NOT enabled: it column-aligns
        # consecutive assignments, which conflicts with PSUseConsistentWhitespace's
        # single-space rule above. We use the single-space (de-aligned) style.
        PSUseCorrectCasing         = @{
            Enable = $true
        }
    }
}
