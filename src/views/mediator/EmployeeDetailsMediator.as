package views.mediator
{
	import org.robotlegs.mvcs.Mediator;
	
	import views.EmployeeDetails;
	import spark.events.IndexChangeEvent;
	import views.DirectReports;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class EmployeeDetailsMediator extends Mediator
	{
		
		[Inject]
		public var employeeDetails:EmployeeDetails;
		
		override public function onRegister():void
		{
			employeeDetails.list.addEventListener(IndexChangeEvent.CHANGE,list_changeHandler);
		}
		
		public function list_changeHandler(event:IndexChangeEvent):void
		{ 
			var action:Object = employeeDetails.list.selectedItem; 
			switch (action.type) 
			{ 
				case "tel": 
					navigateToURL(new URLRequest("tel:"+action.details)); 
					break; 
				
				case "sms": 
					navigateToURL(new URLRequest("sms:"+action.details)); 
					break; 
				
				case "mailto": 
					navigateToURL(new URLRequest("mailto:"+action.details)); 
					break; 
				
				case "employee": 
					employeeDetails.navigator.pushView(EmployeeDetails, action.employee); 
					break; 
				case "reports": 
					employeeDetails.navigator.pushView(DirectReports, action.employee); 
					break; 
		   } 
		} 
	}
}