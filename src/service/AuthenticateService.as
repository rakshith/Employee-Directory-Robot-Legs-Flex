package service
{
	import events.AuthenticateEvent;
	
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import org.robotlegs.mvcs.Actor;

	public class AuthenticateService extends Actor implements IAuthenticateService
	{
		private var gw:NetConnection;
		private var res:Responder;
		private var userName:String;
		private var password:String;
		
		public function AuthenticateService()
		{
			super();
			//gw=new NetConnection();
			//gw.connect("http://localhost/amfphp/gateway.php");
			userName = "123456";
			password = "123456";
		}
		
		public function login(username:String, password:String):void
		{
			//res=new Responder(loginResult,serviceFAULT);
			//gw.call("admin_login.login",res,username,password);
			if(this.userName == username && this.password == password){
				trace("Success from Login Command");				
				var event:AuthenticateEvent=new AuthenticateEvent(AuthenticateEvent.LOGIN_COMPLETE);
				eventDispatcher.dispatchEvent(event);
			}else{
				trace("Failed from Login Command");
			}
		}
		
		/*private function loginResult(e:Object):void
		{
			//Alert.show(e.toString());
			trace(e.toString());
			if(e)
			{
				var event:AuthenticateEvent=new AuthenticateEvent(AuthenticateEvent.LOGIN_COMPLETE);
				dispatch(event);
			}
		}
		private function serviceFAULT(e:Object):void
		{
			//Alert.show(e.toString());
			trace(e.toString());
		}*/
		
		public function logOut():void
		{

		}
		
	}
}