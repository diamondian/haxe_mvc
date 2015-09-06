package com.platinastar.star.mvc.patterns.role;

import com.platinastar.star.mvc.patterns.Proxy;
import com.platinastar.star.mvc.Core;
/**
 * ...
 * @author blandon
 */

class Operator extends Dispatcher
{
	private var _proxyAccess:Class<Proxy>->Proxy;
	public function new() 
	{
		super();
		_proxyAccess = Core.getProxyAccess(this);
	}
	
	public function retrieveProxy(proxyDefinition:Class<Proxy>):Proxy {
		
		return _proxyAccess(proxyDefinition);
	}
}