package views.mediator
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	import views.EmployeeDirectoryHomeView;

	public class EmployeeDirectoryMediator extends Mediator
	{
		
		[Inject]
		public var employeeDirectory:EmployeeDirectory;
		
		override public function onRegister():void
		{
			employeeDirectory.homeBtn.addEventListener(MouseEvent.CLICK,homeBtn);
		}
		
		private function homeBtn(e:MouseEvent):void{
			employeeDirectory.navigator.popAll();
			employeeDirectory.navigator.pushView(EmployeeDirectoryHomeView);
		}
	}
}