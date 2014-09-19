package views.mediator
{
		
	import events.AuthenticateEvent;
	
	import flash.events.MouseEvent;
	
	import model.Employee;
	import model.LoginInfo;
	
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.ViewNavigator;
	
	import views.EmployeeDirectoryHomeView;
	import views.LoginView;
	
	public class LoginViewMediator extends Mediator
	{
		[Inject]
		public var loginView:LoginView;
		
		[Inject]
		public var loginInfo:LoginInfo;
				
		override public function onRegister():void
		{
			loginView.loginBtn.addEventListener(MouseEvent.CLICK,_loginClick);
			loginView.addEventListener(AuthenticateEvent.LOGIN_EVENT,_log);
			eventDispatcher.addEventListener(AuthenticateEvent.LOGIN_COMPLETE, _loginComplete);
		}
		
		override public function onRemove():void{
			loginView.loginBtn.removeEventListener(MouseEvent.CLICK,_loginClick);
			loginView.removeEventListener(AuthenticateEvent.LOGIN_EVENT,_log);
			eventDispatcher.removeEventListener(AuthenticateEvent.LOGIN_COMPLETE,_loginComplete);
		}
		
		private function _loginClick(e:MouseEvent):void
		{	
			
			loginView.errorLabel.text = null;
			
			var results:Array=Validator.validateAll([loginView.empIdStringValidator, loginView.passwdStringValidator]);
			if (results && results.length > 0)
			{
				var errorString:String="";
				var i:int=-1;
				var n:int=results.length;
				while (++i < n)
				{
					var result:ValidationResultEvent=results[i] as ValidationResultEvent;
					errorString+=result.message;
					if (i < n - 1)
						errorString+="\n";
				}
				loginView.errorLabel.text=errorString;
				return;
			}
			
			loginInfo.loginUser(loginView.usrName.text, loginView.passwd.text);			
		}
		
		private function _loginComplete(e:AuthenticateEvent):void{
				trace("login Complete called");	
				loginView.navigator.pushView(EmployeeDirectoryHomeView);
		}
		
		private function _log(e:AuthenticateEvent):void
		{
				trace("logging in please wait");
		}
	}
}