<cfoutput>
	<nav class="bottomNav">
		<ul class="menuList">
			<li>#linkTo(controller="main", text="Home", class="selected")#</li>
			<li>#linkTo(controller="about", text="About")#</li>
			<li>#linkTo(controller="book", text="Book")#</li>
			<li class="last">#linkTo(controller="contact", text="Contact")#</li>
		</ul>
	</nav>
</cfoutput>