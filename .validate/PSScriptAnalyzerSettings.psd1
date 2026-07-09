# PSScriptAnalyzer settings for host-tooling PowerShell scripts.
# Source of truth: host-tooling/common/.validate/ ; deployed to each host repo's
# .validate/ by sync_projects.ps1 (Sync-HostRepo, Pass 2). Consumed by the
# 'Validate: PSScriptAnalyzer' (report) and 'Format: Apply PSScriptAnalyzer'
# (-Fix) VS Code tasks.
#
# Keeps the default rule set (approved verbs, unused vars, BOM, singular nouns,
# trailing whitespace, etc.) and ADDS the opt-in code-formatting rules for full
# reflow (indentation, brace placement, whitespace, casing). Only
# PSAvoidUsingWriteHost is excluded: these are CLI scripts whose output IS
# Write-Host.
#
# SAFETY: the 'Format: Apply PSScriptAnalyzer' task runs -Fix but additionally
# passes -ExcludeRule PSUseSingularNouns,PSUseApprovedVerbs. Those rules' auto-fix
# RENAMES a function's definition WITHOUT updating its call sites, silently
# breaking scripts (PSSA does not flag calls to now-undefined functions). Naming
# issues are therefore reported by the check but never auto-applied — rename by
# hand (update every call site). Do not remove that -ExcludeRule from the task.
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
