<p><strong>Description</strong></p>

<p>YM_Google-Analytics is a <a href="http://www.cfwheels.org">ColdFusion on Wheels</a> plugin that helps you easily track website statistics within your application using Google Analytics' service.</p>

<p>Sign-up for Google Analytics at <a href="http://www.google.com/analytics/">http://www.google.com/analytics/</a>.</p>

<p><strong>Features</strong></p>

<ul>
	<li>Easy configuration and code integration</li>
	<li>SSL support</li>
</ul>

<p><strong>How To Use</strong></p>

<p>When you sign up an account with Google Analytics, you will be prompted to enter information about your website. For each website that you wish to track, Google will provide you UA code such as:</p>

<blockquote>UA-12345678-1</blockquote>

<p>To make this work in Wheels, first go to your <em>config\settings.cfm </em>file and insert the following code:</p>

<blockquote>&lt;cfset set(google.analytics.trackerId = "UA-12345678-1")&gt;</blockquote>

<p>Remember to replace the UA code with the one Google provided you. Also, be sure to RELOAD your Wheels application for the setting to take.</p>

<p>Finally, place the following code anywhere before the &lt;/body&gt; tag in your <em>views\layout.cfm </em>file.</p>

<blockquote>&lt;cfoutput&gt;#googleAnalyticsTag()#&lt;/cfoutput&gt;</blockquote>

<p>If you don't want to place this directly in your layout file, you can always move this code to your views directly.</p>

<p><strong>Attributes</strong></p>

<p>No attributes defined for this plugin.</p>

<p><strong>Result</strong></p>

<p>The plugin generates javascript code which tracks your site visitors.</p>

<blockquote>&lt;script type="text/javascript"&gt;<br>
    var gaJsHost = (("https:" == document.location.protocol) ? "<a href="https://ssl">https://ssl</a>." : "<a href="http://www">http://www</a>.");<br>
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));<br>
    &lt;/script&gt;<br>
    &lt;script type="text/javascript"&gt;<br>
    try {<br>
    var pageTracker = _gat._getTracker("UA-12345678-1");<br>
    pageTracker._trackPageview();<br>
    } catch(err) {}&lt;/script&gt;</blockquote>
 
 
<p>
	Author: Grant Copley (yellowmcfly@gmail.com)<br>
	Website: <a href="http://www.yellowmcfly.com/page.cfm/wheels-plugins/ym-google-analytics">http://www.yellowmcfly.com/page.cfm/wheels-plugins/ym-google-analytics</a><br>
	Last Updated: 11/12/2009
</p>
