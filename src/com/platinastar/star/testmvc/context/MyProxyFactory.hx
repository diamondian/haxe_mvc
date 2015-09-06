package com.platinastar.star.testmvc.context;
import com.platinastar.star.mvc.context.ProxyFactory;
import com.platinastar.star.testmvc.models.MyProxy;
import com.platinastar.star.mvc.patterns.Proxy;
/**
 * ...
 * @author blandon
 */

class MyProxyFactory extends ProxyFactory
{

	public function new() 
	{
		super();
	}
	
	override public function init():Void {
		this.registerProxy(cast MyProxy);
	}
}