package command
{
	import org.robotlegs.mvcs.Command;
	
	import service.IAuthenticateService;
	
	import views.EmployeeDirectoryHomeView;
	
	public class NavigateCommand extends Command
	{
		[Inject]
		public var loginService:IAuthenticateService;		
				
		override public function execute():void
		{
			trace("Login Complete from Navigate Command");
			
		}
	}
}