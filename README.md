# SpoolerHunter
<h1>Description:</h1>
SpoolerHunter is a PowerShell script designed to automate the detection and exploitation of unconstrained delegation computers in a domain environment. The script utilizes the PowerView module to identify vulnerable machines and exploits them using the MS-RPRN.exe tool. It provides options to specify a target machine for the scan and enable verbose output for detailed information during execution.
<h1>Usage:</h1>
<div style="background-color: #f5f5f5; /* Light gray background */
            border: 1px solid #ccc; /* Gray border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px; /* Padding around the content */
            margin-bottom: 20px; /* Margin at the bottom */
            font-family: Arial, sans-serif; /* Font family */
            font-size: 14px; /* Font size */
            line-height: 1.5; /* Line height */
            overflow-x: auto; /* Enable horizontal scrolling if needed */">
    <p>Example command:</p>
    <pre><code>.\SpoolerHunter.ps1 [-TargetMachine <String>] [-Verbose] [-h]</code></pre>
</div>
Parameters:

-TargetMachine <String>: Specifies the target machine for the scan. If not provided, the script scans for unconstrained delegation computers in the domain.
-Verbose: Enables verbose output, displaying detailed information about the scan and exploitation process.
-h: Displays the help message, providing information about the script's usage, parameters, and examples.
