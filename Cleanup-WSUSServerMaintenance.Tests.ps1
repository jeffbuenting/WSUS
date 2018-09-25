$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'


# ----- Get the module name
if ( -Not $PSScriptRoot ) { $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }

$ScriptPath = $PSScriptRoot


Describe "Cleanup-WSUSServerMaintenance" {
    
    Mock -CommandName New-EventLog -MockWith {}

    Mock -CommandName Get-WSUSServer -MockWith {
        New-Object -TypeName PSObject -Property (@{
            'Name' = 'ServerA'
        })
    }

    Mock -CommandName Invoke-WsusServerCleanup -ParameterFilter { $UpdateServer -and $CleanupObsoleteUpdates -and $CleanupObsoleteComputers -and $CleanupUnneededContentFiles } -MockWith {} 

    Mock -CommandName Invoke-Command -MockWith {}

    Mock -CommandName Write-EventLog -MockWith {
        "Event" | Out-File c:\temp\Eventlog.log
    } -Verifiable

    Context Execution {
        
        It 'Should write to the eventlog if there is an error running cleanup wizard' {
            { . $ScriptPath\Cleanup-WSUSServerMaintenance.ps1  } | Should Throw
        }

         It 'Should write to the eventlog if there are no errors and cleanup is complete' {
 
    #        . $ScriptPath\Cleanup-WSUSServerMaintenance.ps1 -verbose
            #Test-Path -Path "TestDrive:\Eventlog.log" | Should Be $True

        }

        It 'Should not throw an error if all works' {
            { . $ScriptPath\Cleanup-WSUSServerMaintenance.ps1  } | Should Not Throw
        }
        
        It 'Should throw if there is an error running cleanup wizard' {
            { . $ScriptPath\Cleanup-WSUSServerMaintenance.ps1  } | Should Throw
        }
    }
}
