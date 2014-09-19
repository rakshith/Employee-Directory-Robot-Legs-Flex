package events
{
	import flash.events.Event;
	
	import model.LoginInfo;

	public class AuthenticateEvent extends Event
	{
		public static const LOGIN_EVENT:String="login";
		public static const LOGIN_COMPLETE:String="complete";
		
		public var loginInfo:LoginInfo;
		
		public function AuthenticateEvent(type:String)
		{
			super(type,true);
		}
		
		override public function clone():Event
		{
			return new AuthenticateEvent(type);
		}
	}
}