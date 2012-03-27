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
			<h3>Admin Options</h3>
			<ul>
				<li>#linkTo(controller="user", action="logout", text="Logout")#</li>
			</ul>
		</div>
	</nav>
</cfoutput>