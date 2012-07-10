<cfoutput>
	
	<!--- Work out if we want to highlight a particular link --->
	<cfparam name="data.page" default="test">
	
	<nav class="bottomNav">
		<ul class="menuList">
			<cfif data.page EQ 'home'>
				<li>#linkTo(controller="main", action="home", text="Home", class="selected")#</li>
			<cfelse>
				<li>#linkTo(controller="main", action="home", text="Home")#</li>
			</cfif>
			<cfif data.page EQ 'about'>
				<li>#linkTo(controller="about", text="About", class="selected")#</li>
			<cfelse>
				<li>#linkTo(controller="about", text="About")#</li>
			</cfif>
			<cfif data.page EQ 'book'>
				<li>#linkTo(controller="book", text="Book", class="selected")#</li>
			<cfelse>
				<li>#linkTo(controller="book", text="Book")#</li>
			</cfif>
			<cfif data.page EQ 'contact'>
				<li class="last">#linkTo(controller="contact", text="Contact", class="selected")#</li>
			<cfelse>
				<li class="last">#linkTo(controller="contact", text="Contact")#</li>
			</cfif>
		</ul>
	</nav>
</cfoutput>