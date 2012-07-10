<cfoutput>
	<nav id="adminNav">
		<div class="navBlock">
			<h3>Country Options</h3>
			<ul>
				<li>#linkTo(controller="country", action="manage", text="View/Edit Countries")#</li>
				<li>#linkTo(controller="country", action="new", text="Add Country")#</li>
			</ul>
		</div>
		
		<div class="navBlock">
			<h3>Page Options</h3>
			<ul>
				<li>#linkTo(controller="about", action="edit", text="Edit About Page")#</li>
				<li>#linkTo(controller="book", action="edit", text="Edit Book Page")#</li>
				<li>#linkTo(controller="contact", action="edit", text="Edit Contact Page")#</li>
			</ul>
		</div>
		
		<div class="navBlock">
			<h3>Admin Options</h3>
			<ul>
				<li>#linkTo(controller="user", action="logout", text="Logout")#</li>
			</ul>
		</div>
	</nav>
</cfoutput>