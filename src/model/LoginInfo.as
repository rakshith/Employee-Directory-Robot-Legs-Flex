package model
{
	import org.robotlegs.mvcs.Actor;
	import mx.utils.StringUtil;
	
	import events.AuthenticateEvent;
	
	public class LoginInfo extends Actor
	{
		public function LoginInfo()
		{
			super();
		}
		
		public var user_name:String;
		public var user_password:String; 
		
		public function loginUser(userName:String, password:String):void{
			
			user_name = StringUtil.trim(userName);
			user_password = StringUtil.trim(password);
			
			var event:AuthenticateEvent=new AuthenticateEvent(AuthenticateEvent.LOGIN_EVENT);
			dispatch(event);
		}
	}
}