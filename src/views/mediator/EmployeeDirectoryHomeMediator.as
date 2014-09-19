package views.mediator
{
	
	import flash.events.MouseEvent;
	
	import model.EmployeeDAO;
	
	import mx.collections.ArrayCollection;
	import mx.core.mx_internal;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.List;
	import spark.components.supportClasses.ListBase;
	
	import views.EmployeeDetails;
	import views.EmployeeDirectoryHomeView;
	
	import spark.events.IndexChangeEvent;
	
	public class EmployeeDirectoryHomeMediator extends Mediator
	{
		
		[Inject]
		public var employeeDirectoryHomeView:EmployeeDirectoryHomeView;
		
		[Inject]
		public var employeeDao:EmployeeDAO;
		
		override public function onRegister():void
		{
			employeeDirectoryHomeView.list.addEventListener(IndexChangeEvent.CHANGE, empListChange);
			employeeDirectoryHomeView.searchBtn.addEventListener(MouseEvent.CLICK, empSearchBtn);
			loadEmployeeList();
		}
		
		private function loadEmployeeList():void{
			employeeDirectoryHomeView.list.dataProvider = employeeDao.findAll();
		}
		
		private function empListChange(e:IndexChangeEvent):void{
			var selectedItem:Object = employeeDirectoryHomeView.list.selectedItem;
			employeeDirectoryHomeView.navigator.pushView(EmployeeDetails, selectedItem);
		}
		
		private function empSearchBtn(e:MouseEvent):void{
			var searchKey:String = employeeDirectoryHomeView.key.text;
			var list:List = employeeDirectoryHomeView.list;			
			
			list.dataProvider = employeeDao.findByName(searchKey);
		}
	}
}