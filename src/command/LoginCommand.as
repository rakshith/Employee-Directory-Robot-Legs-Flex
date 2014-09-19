package command
{
	import events.AuthenticateEvent;
	
	import model.LoginInfo;
	
	import org.robotlegs.mvcs.Command;
	
	import service.IAuthenticateService;

	public class LoginCommand extends Command
	{
		[Inject]
		public var loginService:IAuthenticateService;
		
		[Inject]
		public var loginInfo:LoginInfo;
		
		override public function execute():void
		{
			loginService.login(loginInfo.user_name, loginInfo.user_password);
		}
		
	}
}