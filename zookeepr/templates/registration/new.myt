<h3>Register for the conference</h3>

<p>
Enter your name, and email address, and password, and we'll email you with a confirmation to create your account.
</p>

<p>
If you've already got an account, but can't log in, you can <% h.link_to('recover your password', url=h.url(controller='account', action='forgotten_password')) %>.
</p>

<&| @zookeepr.lib.form:fill, defaults=defaults, errors=errors &>
<% h.form(h.url()) %>

<fieldset id="person">
<p>
<span class="mandatory">*</span>
<label for="person.fullname">Your full name:</label>
<br />
<% h.text_field('person.fullname', size=40) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="person.email_address">Email address:</label>
<br />
<% h.text_field('person.email_address', size=40) %>
<br />
<span class="fielddesc">
Your email address will only be used to correspond with you, and is your login name for the website.  It will not be shown or used otherwise.
</span>
</p>

<p>
<span class="mandatory">*</span>
<label for="person.password">Choose a password:</label>
<br />
<% h.password_field("person.password", size=40) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="person.password_confirm">Confirm your password:</label>
<br />
<% h.password_field("person.password_confirm", size=40) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="person.handle">Display name/handle/nickname:</label>
<br />
<% h.text_field('person.handle', size=40) %>
<br />
<span class="fielddesc">
Your display name will be used to identify you on the website.
</span>
</p>
</fieldset>

<fieldset id="registration">
<h4>Conference Information</h4>
<p>
<span class="mandatory">*</span>
<label for="registration.type">Registration type:</label>
<br />
<% h.select('registration.type', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="registration.miniconfs">Prefered miniconfs:</label>
<br />
<% h.check_box('registration.miniconfs', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<span class="mandatory">*</span>

<label for="registration.dinner">Penguin Dinner:</label>
<br />
<% h.select('registration.dinner', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="registration.type">T-shirt Size:</label>
<br />
<% h.select('registration.tshirt', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<span class="mandatory">*</span>
<label for="registration.opendaydrag">I'm dragging this many people along:</label>
<br />
<% h.select('registration.opendaydrag', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<h4>Personal Information</h4>

<p>
<span class="mandatory">*</span>
<label for="registration.address">Address:</label>
<br />
<% h.text_field('registration.address1', size=40) %>
<% h.text_field('registration.address2', size=40) %>
<label for="registration.city">Suburb:</label>
<br />
<% h.text_field('registration.city', size=40) %>
<label for="registration.state">State:</label>
<br />
<% h.text_field('registration.state', size=40) %>
<label for="registration.country">Country:</label>
<br />
<% h.text_field('registration.country', size=40) %>
<label for="registration.postcode">Postcode:</label>
<br />
<% h.text_field('registration.postcode', size=40) %>
</p>

<p>
<label for="registration.shell">Your shell:</label>
<br />
<% h.select('registration.shell', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.editor">Your editor:</label>
<br />
<% h.select('registration.editor', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.distro">Your distro:</label>
<br />
<% h.select('registration.distro', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.prevlca">Previous LCA's?</label>
<br />
<% h.check_box('registration.prevlca', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.keysigning">Attending the keysigning?</label>
<br />
<% h.check_box('registration.keysigning', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<h4>Partners Programme</h4>

<p>
<label for="registration.partners">Will you be bringing a partner?</label>
<br />
<% h.check_box('registration.partners', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.children">Bringing Children?</label>
<br />
<% h.check_box('registration.children', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
<% h.select('registration.childrenages', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<h4>Accommodation</h4>

<p>
Please check out the <a href="Accommodation">accommodation</a> page before committing to any accommodation choices.
</p>

<p>
<span class="mandatory">*</span>
<label for="registration.accommodation">Do you require student accommodation?</label>
<br />
<% h.check_box('registration.accommodation', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.accommodationtype">What sort of accommodation do you want?</label>
<br />
<% h.select('registration.accommodationtype', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<label for="registration.accommodationdays"></label>
<br />
<% h.check_box('registration.accommodationdays', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<h4>Subscriptions</h4>
# checked by default
<p>
<label for="registration.lasignup">Do you want to sign up for LA membership? (free)</label>
<br />
<% h.check_box('registration.lasignup', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

# checked by default
<p>
<label for="registration.announcesignup">Do you want to sign up to the conference announcement mailing list?</label>
<br />
<% h.check_box('registration.announcesignup', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

# unchecked by default
<p>
<label for="registration.delegatessignup">Do you want to sign up to the conference attendees mailing list?</label>
<br />
<% h.check_box('registration.delegatessignup', option_tags=h.options_for_select_from_objects(c.registration, 'name', 'id')) %>
</p>

<p>
<span class="mandatory">*</span> - Mandatory field
</p>

<% h.submit("Create a new account") %>
</div>


</fieldset>

<% h.end_form() %>
</&>

<%args>
defaults
errors
</%args>
