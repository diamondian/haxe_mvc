package com.platinastar.star.mvc;

import com.platinastar.star.testmvc.context.MyCommandFactory;
import com.platinastar.star.testmvc.context.MyProxyFactory;
import com.platinastar.star.testmvc.YourView;
import jeash.utils.Dictionary;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.TimerEvent;
import nme.Lib;
import nme.utils.Timer;
import nme.text.TextField;
import nme.ObjectHash;
import com.platinastar.star.mvc.context.MainContext;
import com.platinastar.star.testmvc.context.MyMediatorMap;
import com.platinastar.star.testmvc.MyView;
/**
 * ...
 * @author blandon
 */

class Main extends Sprite 
{
	private var _asdf:String;
	private var _mainContext:MainContext;

	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, initApp);
		
		#end
	}
	
	private function initApp(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, initApp);
		// initLog();
		test();
	}
	
	function test(){
		var core = new Core();
		core.init(new MyMediatorMap(),new MyCommandFactory(),new MyProxyFactory());

		var me = new MyView();
		var you = new YourView();
		this.addChild(you);
		this.addChild(me);
		
		//var aaa:Class<Sprite> = Sprite;
		//trace(aaa == Sprite);
	}

	function initLog() 
	{
		var t = new TextField();
		t.text = "initialized";
		this.addChild(t);
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
	
}
