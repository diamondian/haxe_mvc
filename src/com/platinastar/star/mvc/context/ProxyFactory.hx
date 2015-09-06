
package com.platinastar.star.mvc.context;

import com.platinastar.star.mvc.patterns.Proxy;
import nme.ObjectHash;
class ProxyFactory {

	//private static inline emptyArr:Array<Dynamic> = [];
	private var _proxyMap:ObjectHash < Class<Proxy>, Proxy > ;
	
	public function new (){
		_proxyMap = new ObjectHash < Class<Proxy>, Proxy > ();
	} 

	public function registerProxy(proxyClass:Class<Proxy>,?arg:Array<Dynamic>):Void{
		if (_proxyMap.exists(proxyClass)) {
			throw "Proxy type:"+proxyClass+" has been registered already!";
		}else {
			var argArr:Array<Dynamic> = [];
			if (arg != null) {
				argArr = arg;
			}
			_proxyMap.set(proxyClass, Type.createInstance(proxyClass, argArr));	
		}
	}
	
	public function retrieveProxy(proxyClass:Class<Proxy>):Proxy {
		if (_proxyMap.exists(proxyClass) == false) {
			throw "Proxy type:"+proxyClass+" has NOT been registered yet!";
			return null;
		}
		return _proxyMap.get(proxyClass);	
	}
	
	public function init():Void {
		// to be override by registerProxy();
	}
}