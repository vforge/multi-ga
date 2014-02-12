class Multiga
	constructor: ->
		@accounts = []
		@_initga()
		
	_initga: () ->
		ga = document.createElement 'script'
		ga.type = 'text/javascript'
		ga.async = true
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'
		s = ( document.getElementsByTagName 'script' )[ 0 ]
		s.parentNode.insertBefore ga, s
	
	register: ( profile ) ->
		@accounts.push { code: 'tracker' + @accounts.length, profile: profile }
		_gaq.push [ 'tracker' + @accounts.length + '._setAccount', profile ]
		
	trackPageView: ( path ) ->
		_gaq.push [ account.code + '._trackPageview', path ] for account in @accounts
		
	trackEvent: ( category, action, opt_label, opt_value, opt_noninteraction ) ->
		_gaq.push [ account.code + '._trackEvent', category, action, opt_label, opt_value, opt_noninteraction ] for account in @accounts
		
	setDomainName: ( domainName ) ->
		_gaq.push [ account.code + '._setDomainName', domainName ] for account in @accounts
		
	setAllowLinker: ( allowLinker ) ->
		_gaq.push [ account.code + '._setAllowLinker', allowLinker ] for account in @accounts
		
	link: ( targetUrl, useHash ) ->
		_gaq.push [ account.code + '._link', targetUrl, useHash ] for account in @accounts
		
	linkByPost: ( formObject, useHash ) ->
		_gaq.push [ account.code + '._linkByPost', formObject, useHash ] for account in @accounts
		
	setCustomVar: ( index, name, value, opt_scope ) ->
		_gaq.push [ account.code + '._setCustomVar', index, name, value, opt_scope ] for account in @accounts
		
	trackPageLoadTime: ( ) ->
		_gaq.push [ account.code + '._trackPageLoadTime' ] for account in @accounts
		
	trackPageView: ( path ) ->
		_gaq.push [ account.code + '._trackPageview', path ] for account in @accounts

	push: ( array ) ->
		if array instanceof Array and array.length > 0
			command = array[ 0 ]
			for account in @accounts
				array[ 0 ] = account.code + '.'+ command
				_gaq.push array