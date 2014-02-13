var Multiga;

Multiga = (function() {
  function Multiga() {
    this.accounts = [];
    this._initga();
  }

  Multiga.prototype._initga = function() {
    var ga, s, _ref;
    ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ((_ref = 'https:' === document.location.protocol) != null ? _ref : {
      'https://ssl': 'http://www'
    }) + '.google-analytics.com/ga.js';
    s = (document.getElementsByTagName('script'))[0];
    s.parentNode.insertBefore(ga, s);
    return this;
  };

  Multiga.prototype.register = function(profile) {
    this.accounts.push({
      code: 'tracker' + this.accounts.length,
      profile: profile
    });
    _gaq.push(['tracker' + this.accounts.length + '._setAccount', profile]);
    return true;
  };

  Multiga.prototype.trackPageView = function(path) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._trackPageview', path]);
    }
    return this;
  };

  Multiga.prototype.trackEvent = function(category, action, opt_label, opt_value, opt_noninteraction) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._trackEvent', category, action, opt_label, opt_value, opt_noninteraction]);
    }
    return this;
  };

  Multiga.prototype.setDomainName = function(domainName) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._setDomainName', domainName]);
    }
    return this;
  };

  Multiga.prototype.setAllowLinker = function(allowLinker) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._setAllowLinker', allowLinker]);
    }
    return this;
  };

  Multiga.prototype.link = function(targetUrl, useHash) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._link', targetUrl, useHash]);
    }
    return this;
  };

  Multiga.prototype.linkByPost = function(formObject, useHash) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._linkByPost', formObject, useHash]);
    }
    return this;
  };

  Multiga.prototype.setCustomVar = function(index, name, value, opt_scope) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._setCustomVar', index, name, value, opt_scope]);
    }
    return this;
  };

  Multiga.prototype.trackPageLoadTime = function() {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._trackPageLoadTime']);
    }
    return this;
  };

  Multiga.prototype.trackPageView = function(path) {
    var account, _i, _len, _ref;
    _ref = this.accounts;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      account = _ref[_i];
      _gaq.push([account.code + '._trackPageview', path]);
    }
    return this;
  };

  Multiga.prototype.push = function(array) {
    var account, command, _i, _len, _ref;
    if (array instanceof Array && array.length > 0) {
      command = array[0];
      _ref = this.accounts;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        account = _ref[_i];
        array[0] = account.code + '.' + command;
        _gaq.push(array);
      }
    }
    return this;
  };

  return Multiga;

})();
