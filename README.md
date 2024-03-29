# SpoolerHunter
<h1>Description:</h1>
SpoolerHunter is a PowerShell script designed to automate the detection and exploitation of unconstrained delegation computers in a domain environment. The script utilizes the PowerView module to identify vulnerable machines and exploits them using the MS-RPRN.exe tool. It provides options to specify a target machine for the scan and enable verbose output for detailed information during execution.
<h1>Usage:</h1>
<code>.\SpoolerHunter.ps1 [-TargetMachine <String>] [-Verbose] [-h]</code>
</div>
Parameters:

-TargetMachine <String>: Specifies the target machine for the scan. If not provided, the script scans for unconstrained delegation computers in the domain.
-Verbose: Enables verbose output, displaying detailed information about the scan and exploitation process.
-h: Displays the help message, providing information about the script's usage, parameters, and examples.
