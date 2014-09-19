package context
{
	import command.LoginCommand;
	import command.NavigateCommand;
	
	import events.AuthenticateEvent;
	
	import flash.display.DisplayObjectContainer;
	
	import views.mediator.DirectReportsMediator;
	import views.mediator.EmployeeDetailsMediator;
	import views.mediator.EmployeeDirectoryHomeMediator;
	import views.mediator.EmployeeDirectoryMediator;
	import views.mediator.LoginViewMediator;
	
	import model.Employee;
	import model.EmployeeDAO;
	import model.LoginInfo;
	
	import org.robotlegs.mvcs.Context;
	
	import service.AuthenticateService;
	import service.IAuthenticateService;
	
	import views.DirectReports;
	import views.EmployeeDetails;
	import views.EmployeeDirectoryHomeView;
	import views.LoginView;
	
	public class AppContext extends Context
	{
		public function AppContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super();
		}
		
		override public function startup():void{
			super.startup();
			commandMap.mapEvent(AuthenticateEvent.LOGIN_EVENT,LoginCommand);
			commandMap.mapEvent(AuthenticateEvent.LOGIN_COMPLETE,NavigateCommand);
			
			mediatorMap.mapView(LoginView,LoginViewMediator);
			mediatorMap.mapView(EmployeeDirectoryHomeView,EmployeeDirectoryHomeMediator);
			mediatorMap.mapView(DirectReports, DirectReportsMediator);
			mediatorMap.mapView(EmployeeDetails, EmployeeDetailsMediator);
			mediatorMap.mapView(EmployeeDirectory, EmployeeDirectoryMediator);
			
			
			
			injector.mapSingleton(LoginInfo);
			injector.mapSingleton(Employee);
			injector.mapSingleton(AuthenticateEvent);
			injector.mapSingletonOf(IAuthenticateService,AuthenticateService);
			injector.mapSingleton(EmployeeDAO);
		}
	}
}