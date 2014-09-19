package views.mediator
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	
	import views.DirectReports;
	import views.EmployeeDetails;
	
	public class DirectReportsMediator extends Mediator
	{
		
		[Inject]
		public var directReports:DirectReports;
		
		override public function onRegister():void
		{
			directReports.list.addEventListener(IndexChangeEvent.CHANGE, empListChange);
		}
		
		private function empListChange(e:IndexChangeEvent):void{
			var selectedItem:Object = directReports.list.selectedItem;
			directReports.navigator.pushView(EmployeeDetails, selectedItem);
		}
	}
}