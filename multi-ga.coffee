class mga
	constructor: ->
		@accounts = []
		@_initga()
		
	_initga: () ->
		gascript = document.createElement 'script'
		gascript.type = 'text/javascript'
		gascript.async = true
		gascript.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'
		s = ( document.getElementsByTagName 'script' )[ 0 ]
		s.parentNode.insertBefore gascript, s
		this
	
	register: ( profile ) ->
		@accounts.push { code: 'tracker' + @accounts.length, profile: profile }
		_gaq.push [ 'tracker' + @accounts.length + '._setAccount', profile ]
		true
		
	trackPageView: ( path ) ->
		_gaq.push [ account.code + '._trackPageview', path ] for account in @accounts
		this
		
	trackEvent: ( category, action, opt_label, opt_value, opt_noninteraction ) ->
		_gaq.push [ account.code + '._trackEvent', category, action, opt_label, opt_value, opt_noninteraction ] for account in @accounts
		this
		
	setDomainName: ( domainName ) ->
		_gaq.push [ account.code + '._setDomainName', domainName ] for account in @accounts
		this
		
	setAllowLinker: ( allowLinker ) ->
		_gaq.push [ account.code + '._setAllowLinker', allowLinker ] for account in @accounts
		this
		
	link: ( targetUrl, useHash ) ->
		_gaq.push [ account.code + '._link', targetUrl, useHash ] for account in @accounts
		this
		
	linkByPost: ( formObject, useHash ) ->
		_gaq.push [ account.code + '._linkByPost', formObject, useHash ] for account in @accounts
		this
		
	setCustomVar: ( index, name, value, opt_scope ) ->
		_gaq.push [ account.code + '._setCustomVar', index, name, value, opt_scope ] for account in @accounts
		this
		
	trackPageLoadTime: ( ) ->
		_gaq.push [ account.code + '._trackPageLoadTime' ] for account in @accounts
		this
		
	trackPageView: ( path ) ->
		_gaq.push [ account.code + '._trackPageview', path ] for account in @accounts
		this

	push: ( array ) ->
		if array instanceof Array and array.length > 0
			command = array[ 0 ]
			for account in @accounts
				array[ 0 ] = account.code + '.'+ command
				_gaq.push array
		this
